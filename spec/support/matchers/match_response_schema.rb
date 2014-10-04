RSpec::Matchers.define :match_response_schema do |schema|
  match do |response|
    schema_directory = "#{Dir.pwd}/spec/support/api/schemas"
    schema_path = "#{schema_directory}/#{schema}.json"
    begin
      JSON::Validator.validate!(schema_path, response.body, strict: true)
    rescue JSON::Schema::ValidationError => ex
      puts response.body
      raise ex
    end
  end
end

class SignsController < ApplicationController
  def show
    render json: {
      acl: "public-read",
      awsaccesskeyid: aws_access_key_id,
      bucket: bucket,
      expires: expires,
      key: "uploads/#{params[:name]}",
      policy: policy,
      signature: signature,
      success_action_status: "201",
      "Content-Type" => params[:type],
      "Cache-Control" => "max-age=630720000, public"
    }
  end

  private

  def aws_secret_access_key
    ENV["AWS_SECRET_ACCESS_KEY"].to_s
  end

  def aws_access_key_id
    ENV["AWS_ACCESS_KEY_ID"].to_s
  end

  def expires
    @expires ||= 10.hours.from_now
  end

  def bucket
    ENV["AWS_BUCKET"].to_s
  end

  def signature
    Base64.encode64(
      OpenSSL::HMAC.digest(
        OpenSSL::Digest::Digest.new("sha1"),
        aws_secret_access_key,
        policy(secret_access_key: aws_secret_access_key)
      )
    ).gsub(/\n/, '')
  end

  def policy(options={})
    Base64.encode64(
      {
        expiration: expires,
        conditions: [
          { bucket: bucket },
          { acl: "public-read" },
          { expires: expires },
          { success_action_status: "201" },
          [ "starts-with", "$key", "" ],
          [ "starts-with", "$Content-Type", "" ],
          [ "starts-with", "$Cache-Control", "" ],
          [ "content-length-range", 0, 524288000 ]
        ]
      }.to_json
    ).gsub(/\n|\r/, "")
  end
end

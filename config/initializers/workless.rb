Chief::Application.configure do
  Delayed::Job.scaler = Rails.configuration.x.workless.scaler
end
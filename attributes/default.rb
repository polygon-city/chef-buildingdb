default[:buildingdb][:mongodb][:user][:name] = "builder"
default[:buildingdb][:mongodb][:user][:password] = "s3ckr3t"
default[:buildingdb][:mongodb][:database] = "building-database"
default[:buildingdb][:mongodb][:url] = "mongodb://user:password@localhost/building-database"
default[:buildingdb][:report_email_address] = "noreply@example.com"
default[:buildingdb][:report_email_subject] = "Building report"
default[:buildingdb][:reset_email_address] = "noreply@example.com"
default[:buildingdb][:reset_email_subject] = "Password reset"
default[:buildingdb][:session_secret] = "secret"

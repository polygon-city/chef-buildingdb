default[:buildingdb][:deploy_to] = "/srv/building"

default[:buildingdb][:git][:src] = "https://github.com/polygon-city/building-database.git"
default[:buildingdb][:git][:revision] = "baldur/tinkering"

default[:buildingdb][:node][:user] = 'www-data'
default[:buildingdb][:node][:group] = 'www-data'
default[:buildingdb][:node][:environment] = 'production'

default[:buildingdb][:mongodb][:user][:name] = "builder"
default[:buildingdb][:mongodb][:user][:password] = "s3ckr3t"
default[:buildingdb][:mongodb][:database] = "building-database"
default[:buildingdb][:mongodb][:url] = "mongodb://builder:s3ckr3t@localhost/building-database"
default[:buildingdb][:report_email_address] = "noreply@example.com"
default[:buildingdb][:report_email_subject] = "Building report"
default[:buildingdb][:reset_email_address] = "noreply@example.com"
default[:buildingdb][:reset_email_subject] = "Password reset"
default[:buildingdb][:verify_email_address] = "noreply@example.com"
default[:buildingdb][:verify_email_subject] = "Building verify"
default[:buildingdb][:session_secret] = "secret"

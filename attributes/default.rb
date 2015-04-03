default[:buildingdb][:application] = "buildingdb"
default[:buildingdb][:deploy_to] = "/srv/building"
default[:buildingdb][:basic_auth][:enabled] = true
default[:buildingdb][:basic_auth][:user_password] = "bob:$apr1$yx/Nc0zv$xIgxE5yJIAhs6YZU2292S1"

default[:buildingdb][:git][:src] = "https://github.com/polygon-city/building-database.git"
default[:buildingdb][:git][:revision] = "master"

default[:buildingdb][:node][:user] = 'www-data'
default[:buildingdb][:node][:group] = 'www-data'
default[:buildingdb][:node][:environment] = 'production'

default[:buildingdb][:mongodb][:version] = '2.6.8'
default[:buildingdb][:mongodb][:user][:name] = "builder"
default[:buildingdb][:mongodb][:user][:password] = "s3ckr3t"
default[:buildingdb][:mongodb][:database] = "building-database"
default[:buildingdb][:mongodb][:host] = "localhost"
default[:buildingdb][:mongodb][:url] = "mongodb://builder:s3ckr3t@localhost/building-database"
default[:buildingdb][:email][:domain] = "example.com"
default[:buildingdb][:email][:smtp][:host] = "localhost"
default[:buildingdb][:email][:smtp][:user] = "username"
default[:buildingdb][:email][:smtp][:pass] = "password"

default[:buildingdb][:report_email_subject] = "Building report"
default[:buildingdb][:reset_email_subject] = "Password reset"
default[:buildingdb][:verify_email_subject] = "Building verify"
default[:buildingdb][:session_secret] = "secret"

default[:buildingdb][:nginx][:client_max_body_size] = "50M"


default[:buildingdb][:s3][:access_id] = nil
default[:buildingdb][:s3][:access_key] = nil
default[:buildingdb][:s3][:region] = "us-east-1"
default[:buildingdb][:s3][:bucket] = "dev.polygon.city"

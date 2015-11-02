default[:buildingdb][:application] = "buildingdb"
default[:buildingdb][:deploy_to] = "/srv/building"
default[:buildingdb][:basic_auth][:enabled] = true
default[:buildingdb][:basic_auth][:user_password] = "bob:$apr1$yx/Nc0zv$xIgxE5yJIAhs6YZU2292S1"

default[:buildingdb][:git][:src] = "https://github.com/polygon-city/building-database.git"
default[:buildingdb][:git][:revision] = "master"

default[:buildingdb][:node][:user] = 'www-data'
default[:buildingdb][:node][:group] = 'www-data'
default[:buildingdb][:node][:environment] = 'production'

default[:buildingdb][:tmp_directory] = './tmp/'
default[:buildingdb][:site_url] = 'http://dev.polygon.city'

default[:buildingdb][:mongodb][:version] = '2.6.8'
default[:buildingdb][:mongodb][:port] = 27017
default[:buildingdb][:mongodb][:host] = "localhost"
default[:buildingdb][:mongodb][:user] = "builder"
default[:buildingdb][:mongodb][:password] = "s3ckr3t"
default[:buildingdb][:mongodb][:database] = "building-database"
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
default[:buildingdb][:mapzen_pelias_api_key] = "search-28DwiMI"

default[:buildingdb][:s3][:access_id] = nil
default[:buildingdb][:s3][:access_key] = nil
default[:buildingdb][:s3][:region] = "us-east-1"
default[:buildingdb][:s3][:bucket] = "dev.polygon.city"

default[:buildingdb][:sentry_dsl] = "https://87b245aaaacf4a63814f8e3d606ab95d:99839dcbcfb94ff0b0b89a181634aea0@app.getsentry.com/56588"

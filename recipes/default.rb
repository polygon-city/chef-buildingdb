#
# Cookbook Name:: buildingdb
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "mongodb"

application "buildingdb" do
  path "/srv/buildingdb"
  owner "www-data"
  group "www-data"
  packages ["git"]

  repository "https://github.com/polygon-city/building-database.git"

  before_symlink do
    directory "/srv/buildingdb/shared/config"
    directory "/srv/buildingdb/shared/tmp"

    template "/srv/buildingdb/shared/config/config.js" do
      source "config.js.erb"
    end
  end

  symlinks "config/config.js" => "config/config.js",
	   "tmp" => "tmp"

  # nodejs do
  #   entry_point "app.js"
  # end
end

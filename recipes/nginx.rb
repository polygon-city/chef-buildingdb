include_recipe "nginx::default"

file "#{node[:nginx][:dir]}/.htpasswd" do
  content "#{node[:buildingdb][:basic_auth][:user_password]}"
end

template "#{node[:nginx][:dir]}/sites-available/#{node[:buildingdb][:application]}" do
  source 'nginx-site.conf.erb'
  notifies :reload, "service[nginx]"
end

nginx_site node[:buildingdb][:application]

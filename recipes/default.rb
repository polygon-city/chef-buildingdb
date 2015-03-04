%w(mongodb nginx app).each do |r|
  include_recipe "buildingdb::#{r}"
end

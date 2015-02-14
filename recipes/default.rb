%w(mongodb nginx install).each do |r|
  include_recipe r
end

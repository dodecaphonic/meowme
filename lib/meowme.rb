require "sinatra"
require "yaml"
require "set"
require "json"

configure do
  set :cats, YAML.load(open(File.expand_path("assets/cats.yml", __dir__)))
end

def random(count = 5)
  pics = Set.new
  pics << settings.cats.sample while pics.size < count
  pics
end

get "/bomb" do
  content_type :json
  count = Integer(params[:count] || 5)
  { cats: random(count).to_a }.to_json
end

get "/random" do
  content_type :json
  { cat: random(1).first }.to_json
end

get "/count" do
  content_type :json
  { cat_count: settings.cats.size }.to_json
end

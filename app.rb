require "sinatra"
require "pg"

configure :development do
  set :db_config, { dbname: "vacation_list_development" }
end

configure :test do
  set :db_config, { dbname: "vacation_list_test" }
end

def db_connection
  begin
    connection = PG.connect(Sinatra::Application.db_config)
    yield(connection)
  ensure
    connection.close
  end
end

FILENAME = "vacation_list.txt"

get "/" do
  redirect "/vacations"
end

get "/vacations" do
  @vacations = File.readlines(FILENAME)
  erb :vacations
end

post "/vacations" do
  File.open(FILENAME, "a") do |f|
    f.puts params[:destination]
  end
  redirect "/vacations"
end

require "sinatra"
require "pg"
require "pry"

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

get "/" do
  redirect "/vacations"
end

get "/vacations" do
  db_connection do |conn|
    @vacations = conn.exec("SELECT * FROM vacations;")
  end
  erb :vacations
end

post "/vacations" do
  db_connection do |conn|
    unless params["destination"].strip.empty?
      sql_query = "INSERT INTO vacations (destination) VALUES ($1)"
      data = params["destination"]
      conn.exec_params(sql_query, [data])
    end
  end
  redirect "/vacations"
end

get "/vacations/:id" do
  db_connection do |conn|

    sql_query = "SELECT vacations.*, comments.* FROM vacations LEFT JOIN comments ON vacations.id = comments.vacation_id WHERE vacations.id = $1"
    id = params["id"]
    data = [id]

    @comments = conn.exec(sql_query,data)
  end
  erb :show
end

post "/vacations/" do
  db_connection do |conn|
    unless params["destination"].strip.empty?
      sql_query = "INSERT INTO vacations (destination) VALUES ($1)"
      data = params["destination"]
      conn.exec_params(sql_query, [data])
    end
  end
  redirect "/vacations"
end

set :vacations, File.join(File.dirname(__FILE__), "/views")

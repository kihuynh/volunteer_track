require('sinatra')
require('sinatra/reloader')
also_reload('lib/**.*.rb')
require('.lib/project')
require('.lib/volunteer')
require('pry')

DB = PG.connect({:dbname => 'volunteer_tracker'})

# homebase
get('/') do
  erb(:home)
end

get('/output') do
  erb(:output)
end

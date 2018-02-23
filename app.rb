require('sinatra')
require('sinatra/reloader')
also_reload('lib/**.*.rb')
require('./lib/project')
require('./lib/volunteer')
require('pry')
require('pg')

DB = PG.connect({:dbname => 'volunteer_tracker'})

# homebase
get('/') do
  @projects = Project.all
  erb(:home)
end

post('/') do

end

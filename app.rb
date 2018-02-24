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
  title = params.fetch("title")
  project = Project.new({:title => title, :id => nil})
  project.save
  @projects = Project.all
  erb(:home)
end

# goes to project id
get('/projects/:id') do
  @projects = Project.find(params.fetch("id").to_i)

  erb(:projects)
end

# add volunteers
post('/projects/:id') do
  @projects = Project.find(params.fetch("id").to_i)
  volunteer = Volunteer.new({:name => name, :project_id => project_id, :id => nil})
  volunteer.save
  @volunteers = Volunteer.all
  erb(:projects)
end

# edit project. to delete, and update. edit project name. delete volunteers?

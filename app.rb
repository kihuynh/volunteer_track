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
  @project = Project.new({:title => title, :id => nil})
  @project.save
  @projects = Project.all
  erb(:home)
end

# goes to project id
get('/projects/:id') do
  @project = Project.find(params.fetch("id").to_i)
  @volunteers = Volunteer.all
  erb(:projects)
end

# add volunteers
post('/projects/:id') do
  @project = Project.find(params.fetch("id").to_i)
  name = params.fetch("name")
  @project.id = params.fetch("project.id").to_i
  id = volunteer.fetch("id").to_i
  volunteer = Volunteer.new({:name => name, :project_id => @project.id, :id => nil})
  volunteer.save
  # @project.id = volunteer.project_id
  # @volunteers = Volunteer.all
  erb(:projects)
end

# edit project. to delete, and update. edit project name. delete volunteers?
get('projects/:id/edit') do
  @projects = Project.find(params.fetch("id").to_i)

  erb(:project_edit)
end

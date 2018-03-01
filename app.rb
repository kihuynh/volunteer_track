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
  erb(:projects)
end

# add volunteers
post('/projects/:id') do
  @project = Project.find(params.fetch("id").to_i)
  name = params.fetch("name")
  @volunteer = Volunteer.new({:name => name, :project_id => @project.id, :id => nil})
  @volunteer.save

  erb(:projects)
end

# will go take that project.id into edit page
get('/projects/:id/edit') do
  @project = Project.find(params.fetch("id").to_i)
  erb(:project_edit)
end

# submit change and goes back to projects page
patch('/projects/:id') do
  title = params.fetch("title")
  @project = Project.find(params.fetch("id").to_i)
  @project.update({:title => title})
  erb(:projects)
end

delete('/projects/:id') do
  @project = Project.find(params.fetch("id").to_i)
  @project.delete
  @projects = Project.all
  erb(:home)
end

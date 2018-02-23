require('sinatra')
require('sinatra/reloader')
also_reload('lib/**.*.rb')
require('pry')

get('/') do
  erb(:input)
end

get('/output') do
  erb(:output)
end
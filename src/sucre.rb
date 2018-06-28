require 'rubygems'
require 'sinatra'

get '/add_task' do
  erb :form
end

post '/add_task' do
  status 200
  @@tasks = params[:task]
  "You add a new task: #{params[:task]}"
end

get '/tasks' do
  status 200
  "You have to do: #{@@tasks}"
end

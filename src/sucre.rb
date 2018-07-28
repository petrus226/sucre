require 'rubygems'
require 'sinatra'
require 'json'

# @@hash_receive = {:name => "Arnau", :tasks => Array.new{Hash.new}}

get '/read' do
  status 200
  JSON.generate(@@hash_receive)
end

post '/add_task' do
  status 200
  @@hash_receive = JSON.parse(params[:json])
  data_update = {:name => params[:task_name], :date => params[:task_date]}
  @@hash_receive["tasks"].push(data_update)
  JSON.generate(@@hash_receive)
end

post '/add_task_not_json' do
  status 200
  data_update = {:name => params[:task_name], :date => params[:task_date]}
  @@hash_receive["tasks"].push(data_update)
  JSON.generate(@@hash_receive)
end

get '/tasks' do
  status 200
   task_list = @@hash_receive["tasks"]
   JSON.generate(task_list)
end

post '/delete_task' do
  status 200
  puts @@hash_receive
  @@hash_receive["tasks"].pop
  JSON.generate(@@hash_receive)
end

require 'rubygems'
require 'sinatra'
require 'json'

@@hash_receive

post '/add_task' do
  status 200
  @@hash_receive = JSON.parse(params[:json])
  data_update = {:name => params[:task_name], :date => params[:task_date]}
  @@hash_receive["tasks"].push(data_update)
  JSON.generate(@@hash_receive)
end

get '/tasks' do
  status 200

   task_list = @@hash_receive["tasks"]
   puts "HASH"
   puts task_list
   puts "JSON"
   puts JSON.generate(task_list)
   JSON.generate(task_list)
end

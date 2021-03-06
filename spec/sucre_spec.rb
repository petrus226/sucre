
require_relative '../src/sucre'

require 'rspec'
require 'rack/test'
require 'json'

describe 'The Sucre app' do

  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it 'add a new task' do
    my_hash = {:name => "Arnau", :tasks => Array.new{Hash.new}}
    my_json = JSON.generate(my_hash)

    post '/add_task', :json => my_json, :task_name => task_name_1, :task_date => time
    expect(last_response).to be_ok
    expect((JSON.parse(last_response.body)["tasks"]).length).to eq(1)
  end

  it 'add two task' do
    post '/add_task_not_json', :task_name => "Limpiar", :task_date => 100
    expect(last_response).to be_ok
    expect((JSON.parse(last_response.body)["tasks"]).length).to eq(2)
  end

  it 'show the tasks save' do
    my_hash = {:name => "Arnau", :tasks => Array.new{Hash.new}}
    my_json = JSON.generate(my_hash)

    post '/add_task_not_json', :task_name => task_name_1, :task_date => time
    post '/add_task_not_json', :task_name => task_name_1, :task_date => time
    get '/tasks'
    expect(last_response).to be_ok
    expect(((JSON.parse(last_response.body))[0])["name"]).to eq("Comprar fruta")
  end

  it 'delete a task' do

    get '/read'
    expect(last_response).to be_ok
    old_length = (JSON.parse(last_response.body)["tasks"]).length
    post '/delete_task'
    expect(last_response).to be_ok
    expect((JSON.parse(last_response.body)["tasks"]).length).to eq(old_length-1)
  end

  def task_name_1
    'Comprar fruta'
  end

  def time
    10
  end

  def task_name_2
    'Tender'
  end

end

require_relative '../src/sucre'

require 'rspec'
require 'rack/test'

describe 'The Sucre app' do

  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it 'add a new task' do
    post '/add_task', :task => task_name_1
    expect(last_response).to be_ok
    expect(last_response.body).to eq("You add a new task: #{task_name_1}")
  end

  it 'show the task save' do
    post '/add_task', :task => task_name_1
    get '/tasks'
    expect(last_response).to be_ok
    expect(last_response.body).to eq("You have to do: #{task_name_1}")
  end

  def task_name_1
    'Comprar fruta'
  end

  def task_name_2
    'Tender'
  end

end

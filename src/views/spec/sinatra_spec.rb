require_relative '../src/basics'

require "test/unit"
require 'rspec'
require 'rack/test'

describe 'The HelloWorld App' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "says hello" do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to eq('Hello, World')
  end

  it "says a little about me" do
    get '/about'
    expect(last_response).to be_ok
    expect(last_response.body).to eq('A little about me.')
  end

  it "says my name" do
    get '/name/Pepe'
    expect(last_response).to be_ok
    expect(last_response.body).to eq('Pepe')
  end

  it "says me name upcase" do
    get '/name/upcase/pepe'
    expect(last_response).to be_ok
    expect(last_response.body).to eq('PEPE')
  end

  it "return param in a sentence" do
    get '/hello/Pepe'
    expect(last_response).to be_ok
    expect(last_response.body).to eq('Hello there, Pepe.')
  end

  it "return two params in a sentence" do
    get '/hello/from/Pepe/Valencia'
    expect(last_response).to be_ok
    expect(last_response.body).to eq('Hey there Pepe from Valencia.')
  end

  it "return two params in a sentence" do
    get '/hello/from/Pepe/Valencia'
    expect(last_response).to be_ok
    expect(last_response.body).to eq('Hey there Pepe from Valencia.')
  end

  it "gives the form" do
    get '/form'
    expect(last_response).to be_ok
    expect(last_response.body).to include('form')
    expect(last_response.headers['Content-Type']).to include('text/html')
  end

  it 'gives the info about the post' do
    get '/form', :message => 'Simon'
    #p last_response.body
    post '/form'
    #p last_response.body
  end

  it 'gives the info post' do
    get 'secret'
    p last_response.body
  end


end

def my_name
  Pepe
end

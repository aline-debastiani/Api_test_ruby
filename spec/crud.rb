require 'httparty'
require 'spec_helper'

class Api
  include HTTParty
  base_uri 'http://localhost:3000/'
end

RSpec.describe 'info json server - requisição GET' do
  it 'efetuando requisição GET' do
    @response = Api.get('/users')
    expect(@response.code).to eql(200)
  end
end

RSpec.describe 'info json server - requisição POST' do
  it 'efetuando requisição POST' do
         @usuario = 
          {
            "name": "Danilo",
            "location": "sp"
          }  
        

    @response = Api.post('/users', :body => @usuario) 
    expect(@response.code).to eql(201)
  end
end


RSpec.describe 'info json server - requisição PUT' do
  it 'efetuando requisição PUT' do
         @usuario = 
          {
            "name": "dureza Andre",
            "location": "sp"
          }  
        

    @response = Api.put('/users/2', :body => @usuario)
    expect(@response.code).to eql(200)
  end
end


RSpec.describe 'info json server - requisição DELETE' do
  it 'efetuando requisição DELETE' do
    @response = Api.delete('/users/2', :body => @usuario)
    expect(@response.code).to eql(200)
  end
end


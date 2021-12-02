require 'httparty'
require 'spec_helper'

class Api
  include HTTParty
  base_uri 'https://petstore.swagger.io/v2/'
end

RSpec.describe 'Consultar usuários de um PetShop' do
  it 'Realizar login de um usuário' do
    @response = Api.get('/user/login?username=Aline&password=123456')
    expect(@response.code).to eql(200)
  end

  it 'Criar um usuário' do
    @usuario = 
     {
        "id": 1,
        "username": "fulanaSilva",
        "firstName": "Fulana",
        "lastName": "Silva",
        "email": "fulanaSilva@email.com",
        "password": "123456",
        "phone": "1292000000",
        "userStatus": 0
     }.to_json
   
    @response = Api.post('/user', :body => @usuario, :headers => {"accept" => "application/json", "Content-Type" => "application/json"})
    expect(@response.code).to eql(200)
    end

    it 'Atualizar um usuário' do
        @usuario = 
        {
            "id": 0,
            "username": "string",
            "firstName": "string",
            "lastName": "string",
            "email": "string",
            "password": "string",
            "phone": "string",
            "userStatus": 0
        }.to_json
            
    
        @response = Api.put('/user/fulanaSilva', :body => @usuario, :headers => {"accept" => "application/json", "Content-Type" => "application/json"})
        expect(@response.code).to eql(200)
    end

    it 'Deletar um usuário' do
        @response = Api.delete('/user/fulanaSilva', :headers => {"accept" => "application/json"})
        expect(@response.code).to eql(200)
    end
end
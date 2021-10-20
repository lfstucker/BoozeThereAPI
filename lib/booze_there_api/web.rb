#!/urs/bin/env ruby

require 'oj'
require 'sinatra/base'
require 'sinatra/contrib'
require 'sinatra/multi_route'
require 'sinatra/respond_with'
require 'sinatra/namespace'
require 'sinatra/reloader'

module BoozeThereAPI
  class Web < Sinatra::Base
    before do
      content_type :json
    end

    get '/' do
      BoozeThereAPI.default_saying
    end

    post '/add' do
      return 'wip'
    end

    get '/current_points' do
      return 'wip'
    end

    get '/offers' do
      return 'wip'
    end

    get '/loc_blob' do
      return {
        'points': [
          {
            'lat': 41.23805054574209,
            'long': -96.1028454746074,
            'status': 'good'
          }, {
            'lat': 41.23546782828897,
            'long': -96.08183441273047,
            'status': 'bad'
          }, {
            'lat': 41.21145061730776,
            'long': -96.08155766738089,
            'status': 'good'
          }, {
            'lat': 41.23192741470015,
            'long': -96.00603359859244,
            'status': 'meh'
          }, {
            'lat': 41.240072314983166,
            'long': -95.95539148928923,
            'status': 'good'
          }, {
            'lat': 41.24909655924868,
            'long': -95.93343681812979,
            'status': 'bad'
          }, {
            'lat': 41.27748178359846,
            'long': -95.98905531840035,
            'status': 'good'
          }, {
            'lat': 41.291559796217065,
            'long': -96.01042453166221,
            'status': 'good'
          }, {
            'lat': 41.25965994453668,
            'long': -95.92787496810273,
            'status': 'meh'
          }, {
            'lat': 41.260980247588705,
            'long': -95.9363641076177,
            'status': 'good'
          }, {
            'lat': 41.25655079387113,
            'long': -95.93225648592966,
            'status': 'good'
          }, {
            'lat': 41.25609769218507,
            'long': -95.93304370625533,
            'status': 'meh'
          }, {
            'lat': 41.255792540276204,
            'long': -95.93229338685703,
            'status': 'good'
          }
        ]
      }
    end

    after do
      response.body = JSON.dump(response.body)
    end
  end
end

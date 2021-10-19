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
      return 'wip'
    end
  end
end

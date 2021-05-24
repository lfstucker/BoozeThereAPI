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
    end
end


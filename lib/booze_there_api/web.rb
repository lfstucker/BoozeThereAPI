#!/urs/bin/env ruby

require 'oj'
require 'sinatra/base'
require 'sinatra/contrib'
require 'sinatra/multi_route'
require 'sinatra/respond_with'
require 'sinatra/namespace'
require 'sinatra/reloader'
require 'mongoid'

module BoozeThereAPI
    class Web < Sinatra::Base

        Mongoid.load!(File.join(File.dirname(__FILE__), 'config', 'mongoid.yml'))

        get '/' do
            BoozeThereAPI.default_saying
        end

        get '/posts' do
            Post.all.to_json
          end
          
          post '/posts' do
            post = Post.create!(params[:post])
            post.to_json
          end
          
          get '/posts/:post_id' do |post_id|
            post = Post.find(post_id)
            # post.attributes.merge(
            #   comments: post.comments,
            # ).to_json
          end
          
        #   post '/posts/:post_id/comments' do |post_id|
        #     post = Post.find(post_id)
        #     comment = post.comments.create!(params[:comment])
        #     {}.to_json
        #   end
    end

    class Post
        include Mongoid::Document
      
        field :reaction, type: String
        field :latitude, type: Float
        field :longitude, type: Float
        field :ssn
        index({ ssn: 1 }, { name: "location_index", expire_after_seconds: 2.hours })
        # field :ssn
        # index({ ssn: 1 }, { name: "location_index", expireAfterSeconds: 3600 })

      end
end






# class Post
#     include Mongoid::Document
  
#     field :reaction, type: String
#     field :coordinates, type: Float[]
  
#     has_many :comments
#   end
  
#   class Comment
#     include Mongoid::Document
  
#     field :name, type: String
#     field :message, type: String
  
#     belongs_to :post
#   end

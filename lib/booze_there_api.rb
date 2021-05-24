require 'booze_there_api/version'
require 'booze_there_api/web'

module BoozeThereAPI
    class << self
        def default_saying
            {
            version: BoozeThereAPI::VERSION
        }
        end
    end
end

require 'booze_there_api/version'
require 'booze_there_api/web'

module BoozeThereAPI
    class << self
        def self.default_saying
            version: BoozeThereAPI::version
        end
    end
end

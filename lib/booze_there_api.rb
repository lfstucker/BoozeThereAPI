# frozen_string_literal: true

require 'booze_there_api/version'
require 'booze_there_api/data'
require 'booze_there_api/web'

module BoozeThereAPI
  class << self
    def start!
      puts 'starting up booze there api *****************************'
      BoozeThereAPI::Data.start!
    end

    def default_saying
      saying = {
        version: BoozeThereAPI::VERSION,
        migration_version: BoozeThereAPI::Data.migration_version
      }
    end
  end
end

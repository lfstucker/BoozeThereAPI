# frozen_string_literal: true

require 'booze_there_api/version'
require 'booze_there_api/web'

module BoozeThereAPI
  class << self
    def default_saying
      saying = { version: BoozeThereAPI::VERSION }
      saying.to_s
    end
  end
end

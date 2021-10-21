# frozen_string_literal: true

# \ --quiet
# frozen_string_litteral: true

# require_relative 'puma'
# require_relative 'oj'
# require_relative 'multi_json'

require 'booze_there_api'
require 'booze_there_api/web'

BoozeThereAPI.start!
run BoozeThereAPI::Web

at_exit do
end

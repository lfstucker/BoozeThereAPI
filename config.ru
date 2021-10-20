# frozen_string_literal: true

# \ --quiet
# frozen_string_litteral: true

# require_relative 'puma'
# require_relative 'oj'
# require_relative 'multi_json'

require 'booze_there_api'
require 'booze_there_api/web'

run BoozeThereAPI::Web

use Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: :any
  end  
end

at_exit do
end

#\ --quiet
#frozen_string_litteral: true

require 'puma'
require 'oj'
require 'multi_json'

require 'booze_there_api'
require 'booze_there_api/web'

run BoozeThereAPI::Web

at_exit do

end

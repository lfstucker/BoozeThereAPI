#\ --quiet
#frozen_string_litteral: true

require_relative 'puma'
require_relative 'oj'
require_relative 'multi_json'

require_relative 'booze_there_api'
require_relative 'booze_there_api/web'

run BoozeThereAPI::Web

at_exit do

end

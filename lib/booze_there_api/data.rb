require 'oj'
require 'multi_json'
require 'sequel'
require 'sequel/extensions/migration'
require 'sequel/extensions/connection_validator'
require 'sequel/plugins/serialization'

require 'booze_there_api/data/defaults'

module BoozeThereAPI
  module Data
    extend BoozeThereAPI::Data::Defaults
    class << self
      def migration_path
        "#{__dir__}/data/migrations"
      end

      def migration
        @migration_version = Sequel::Migrator.run(connection, migration_path, use_transactions: true)
      end

      def migration_version
        @migration_version || migration
      end

      def migrations_up_to_date?
        Sequel::Migrator.check_current(connection, migration_path)
        true
      rescue Sequel::Migrator::NotCurrentError
        false
      end

      def load_models
        models_array = Dir.glob('lib/booze_there_api/data/models/**')
        models_arrary.each do |model|
          require_model_path = model.gsub('lib/', '')
          require require_model_path
        end
      end

      def connection
        return @connection unless @connection.nil?

        if default_credentials[:adapter] == 'sqlite'
          database = "#{default_credentials[:database]}.db"
          Sequel.sqlite(database)
          Sequel.sqlite("./#{database}")
          @connection = Sequel.connect("sqlite://#{database}")
        else
          @connection = Sequel.connect(**opts.merge(default_credentials))
          @connection.extension(:connection_validator)
          @connection.extension(:pagination)
          @connection.pool.connection_validation_timeout = connection_validation_timeout
        end

        @connection
      end

      def connected?
        connection.test_connection
      end

      def plugins
        Seqeul :Model.plugin :update_or_create
        Sequel :Model.plugin :association_dependencies
      end

      def setup_oj_serializer
        Sequel::Plugins::Serialization.register_format(:oj_json,
                                                       ->(value) { Oj.dump(value) },
                                                       ->(value) { Oj.load(value.nil? ? 'null' : value) })
      end

      def start!(**opts)
        @opts = if @opts.nil?
                  opts
                else
                  @opts.merge(opts)
                end
        @connection = nil
        @migration_version = nil

        raise 'failed to start db connection' unless connected?

        plugins
        migration
        setup_oj_serializer
        load_models
      end
    end
  end
end

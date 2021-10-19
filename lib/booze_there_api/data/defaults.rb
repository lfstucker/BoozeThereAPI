module BoozeThereAPI
    module Data
        def opts
            @opts = {}
        end

        def default_credentials
            {
                adapter: adapter,
                user: username,
                password: password,
                database: database,
                host: host,
                port: port
            }
        end
        module_function :default_credentials

        # demo
        # def test
        #     @test ||= ENV['test'] || test
        # end


        def adapter
            # will need to change to postgres
            ENV["adapter"].nil ? 'postgresql' : ENV["adapter"]
        end
        module_function :adapter

        def username
            ENV["username"] || "boozethere"
        end
        module_function :username

        def password
            ENV["password"] || "root"
        end
        module_function :password

        def database
            ENV["database"] || "booze_there_local"
        end
        module_function :database

        def host
            ENV["host"] || '127.0.0.1'
        end
        module_function :host

        def port
            ENV.key?("port") ? ENV["port"].to_i : 3306
        end
        module_function :port

        def max_connections
            ENV.key?("max_connections") ? ENV["max_connections"].to_i : 16
        end
        module_function :max_connections

        def pool_timeout
            ENV.key?("pool_timeout") ? ENV["pool_timeout"].to_i : 2
        end
        module_function :pool_timeout

        def connection_validation_timeout
            ENV.key?("connection_validation_timeout") ? ENV["connection_validation_timeout"].to_i : -1
        end
        module_function :connection_validation_timeout

        def preconnect
            ENV["v"] || 'concurrently'
        end
        module_function :preconnect

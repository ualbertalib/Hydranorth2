require 'redis'
erb_object = ERB.new(IO.read(Rails.root.join('config', 'redis.yml'))).result
config = YAML.safe_load(erb_object)[Rails.env].with_indifferent_access
Redis.current = Redis.new(config.merge(thread_safe: true))

require 'redis'
erb_object = ERB.new(IO.read(File.join(Rails.root, 'config', 'redis.yml'))).result
config = YAML.load(erb_object)[Rails.env].with_indifferent_access
Redis.current = Redis.new(config.merge(thread_safe: true))

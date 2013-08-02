module RedisDatapump
  class Importer
    IMPORTER_MAP = {
      'string' => proc {|client, key, value| client.set(key, value)},
      'hash' => proc {|client, key, values| client.hmset(key, values)},
      'set' => proc {|client, key, members| client.sadd(key, members)},
      'list' => proc {|client, key, values| client.rpush key, values },
      'zset' => proc {|client, key| client.zrange(key, 0, -1, :with_scores => true) },
    }
    def initialize opts
      @options = opts
      Validator.new(@options).validate!
    end

    def import content
      IMPORTER_MAP[content['type']].call(redis_client, content['key'], content['value'])
      @redis_client.pexpire(content['key'], content['ttl']) if content['ttl'] != -1
    end

    def redis_client
      return @redis_client if @redis_client
      url = "#{@options[:redis_url]}/#{@options[:redis_database]}"
      @redis_client = Redis.connect(url: url)
    end
  end
end

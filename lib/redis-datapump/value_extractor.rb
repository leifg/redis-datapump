module RedisDatapump
  class ValueExtractor
    VALUE_MAP = {
      'string' => proc {|client, key| client.get(key)},
      'hash' => proc {|client, key| client.hgetall(key)},
      'set' => proc {|client, key| client.smembers(key)},
      'list' => proc {|client, key| client.lrange key, 0, -1 },
      'zset' => proc {|client, key| client.zrange(key, 0, -1, :with_scores => true) },
    }

    def initialize redis_client, key
      @redis_client = redis_client
      @key = key
      @type = @redis_client.type(key)
      @ttl = @redis_client.pttl(key)
      @value = VALUE_MAP[@type].call(@redis_client, @key)
    end

    def content
      {
        key: @key,
        type: @type,
        value: @value,
        ttl: @ttl,
      }
    end
  end
end
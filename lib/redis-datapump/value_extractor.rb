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
    end

    def content
      return @content if @content

      type = @redis_client.type(@key)
      @content = {
        key: @key,
        type: type,
        value: VALUE_MAP[type].call(@redis_client, @key),
        ttl: @redis_client.pttl(@key),
      }
    end
  end
end

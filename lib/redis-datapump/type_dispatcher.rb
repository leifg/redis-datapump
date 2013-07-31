module RedisDatapump
  class ValueExtractor
    VALUE_MAP = {
      'string' => proc {|client, key| client.get(key)},
      'hash' => proc {|client, key| client.hgetall(key)},
      'set' => proc {|client, key| client.smembers(key)},
      'list' => proc {|client, key| client.hgetall(key)},
      'zset' => proc {|client, key| client.hgetall(key)},
    }


    def initialize redis_client, key
      @redis_client = redis_client
      @key = key
      @type = type(@key)
    end

    def value
      VALUE_MAP[@type].call(@redis_client, @key)
    end

    def type key
      redis_client.type(key)
    end
  end
end
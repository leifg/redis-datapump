module RedisDatapump
  class Exporter
    def initialize opts
      @options = opts
    end

    def export &blk
      Validator.new(@options).validate!
      keys('*').each do |key|
        blk.call(ValueExtractor.new(redis_client, key).content)
      end
    end

    private
    def keys glob
      redis_client.keys(glob)
    end

    def redis_client
      return @redis_client if @redis_client
      url = "#{@options[:redis_url]}/#{@options[:redis_database]}"
      @redis_client = Redis.connect(url: url)
    end
  end
end

module RedisDatapump
  class Exporter
    def initialize opts
      @options = opts
    end

    def redis_client
      return @redis_client if @redis_client
      url = "#{@options[:redis_url]}/#{@options[:redis_database]}"
      @redis_client = Redis.connect(url: url)
    end

    def export
      Validator.new(@options).validate!
      keys('*').each do |key|
        type = type(key)
      end
    end

    private
    def keys glob
      redis_client.keys(glob)
    end
  end
end
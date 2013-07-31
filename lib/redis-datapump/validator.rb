module RedisDatapump
  class Validator
    def initialize opts
      @options = opts
    end

    def validate!
      if @options[:redis_database].nil?
        raise ArgumentError, 'Please specify a database'
      end
    end
  end
end

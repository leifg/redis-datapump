#encoding: utf-8
require 'spec_helper'

describe RedisDatapump::Exporter do
  subject do 
    exporter = described_class.new({
      redis_url: 'redis://localhost:6379',
      redis_database: '0',
    })
    exporter.stub(:redis_client).and_return(mock_redis)
    exporter
  end

  let(:mock_redis) do
    mr = MockRedis.new
    mr.stub(:pttl).and_return(-1)
    mr
  end

  describe 'export' do
    it 'calls keys' do
      expect(subject)
        .to receive(:keys).and_return([])
      subject.export
    end

    it 'yields the content' do
      mock_redis.set('string_key', 'string_value')
      expect{|b| subject.export(&b)}.to yield_control.once
    end
  end
end

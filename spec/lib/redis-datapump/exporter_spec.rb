#encoding: utf-8
require 'spec_helper'

describe RedisDatapump::Exporter do
  subject do 
    described_class.new({
      redis_url: 'redis://localhost:6379',
      redis_database: '0',
    })
  end
  describe 'export' do
    it 'calls keys' do
      expect(subject)
        .to receive(:keys).and_return([])
      subject.export
    end

    it 'checks type' do
      expect(subject)
        .to receive(:keys).and_return(%w{string set}).ordered
      expect(subject)
        .to receive(:type).with('string').and_return('string').ordered
      expect(subject)
        .to receive(:type).with('set').and_return('set').ordered
      subject.export
    end
  end
end

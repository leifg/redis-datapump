#encoding: utf-8
require 'spec_helper'

describe RedisDatapump::Validator do
  describe '#validate!' do
    it 'raises no exception for valid input' do
      expect do
        described_class.new(redis_database: '0').validate!
      end.to_not raise_error
    end

    it 'raises a RuntimeError for missing redis_database' do
      expect do
        described_class.new({}).validate!
      end.to raise_error(ArgumentError, 'Please specify a database')
    end
  end
end

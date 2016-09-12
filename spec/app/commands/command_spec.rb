# frozen_string_literal: true

require_relative '../../spec_helper.rb'

RSpec.describe Command do
  class DummyCommand < Command
  end

  context '.validations' do
    it 'raise NotImplementedError if validations are not implemented' do
      expect { DummyCommand.new.validate(nil, nil) }.to raise_error NotImplementedError
    end
  end

  context '.run' do
    it 'raise NotImplementedError if run is not implemented' do
      expect { DummyCommand.new.run(nil, nil) }.to raise_error NotImplementedError
    end
  end

  context '.execute' do
    it 'call validations and run' do
      dummy = DummyCommand.new
      expect(dummy).to receive(:validate).once
      expect(dummy).to receive(:run).once
      dummy.execute(nil, nil)
    end
  end
end

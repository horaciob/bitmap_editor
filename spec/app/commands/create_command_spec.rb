# frozen_string_literal: true
require_relative '../../spec_helper.rb'

RSpec.describe CreateCommand do
  context '.run' do 
   it 'creates a new Bitmap' do 
    allow(Bitmap).to receive(:new).with(2,2)
    CreateCommand.new.execute('I 2 2')
   end
  end
  context '.validations' do
    it 'throws  ValidationError when rows number isn\'t a number' do
      expect { CreateCommand.new.validate(%w(I N 1)) }.to raise_error ValidationError
    end

    it 'throws  ValidationError when rows is 0' do
      expect { CreateCommand.new.validate(%w(I 0 5)) }.to raise_error ValidationError
    end

    it 'throws  ValidationError when col number isn\'t a number' do
      expect { CreateCommand.new.validate(%w(I 5 N)) }.to raise_error ValidationError
    end

    it 'throws ValidationError when columns is 0' do
      expect { CreateCommand.new.validate(%w(I 5 0)) }.to raise_error ValidationError
    end
  end
end

# frozen_string_literal: true
require_relative '../../spec_helper.rb'

RSpec.describe ChangeCommand do
  let(:bitmap){Bitmap.new(4,5)}

  context '.execute' do 
    it 'creates a new Bitmap' do 
      ChangeCommand.new.execute(bitmap, 'L 1 1 C')
      expect(bitmap.matrix[0][0]).to eql 'C'

    end
  end

  context '.validations' do
    it 'throws  ValidationError if first parameter is not a Bitmap' do
      expect { ChangeCommand.new.validate(nil,%w(L 1 1 C)) }.to raise_error ValidationError
    end

    it 'Not valid if has more args' do
      expect { ChangeCommand.new.validate(bitmap, %w(L 1 1 1 C)) }.to raise_error ValidationError
    end
    it 'Not valid when row index is out of range' do
      expect { ChangeCommand.new.validate(bitmap, %w(L 6 1 C)) }.to raise_error ValidationError
    end
    it 'Not valid if has col index is out of range' do
      expect { ChangeCommand.new.validate(bitmap, %w(L 1 5 C)) }.to raise_error ValidationError
    end
    it 'Not valid when row index less than rows' do
      expect { ChangeCommand.new.validate(bitmap, %w(L 0 1 C)) }.to raise_error ValidationError
    end

    it 'Not valid when cols index less than cols' do
      expect { ChangeCommand.new.validate(bitmap, %w(L 1 0 C)) }.to raise_error ValidationError
    end

    it 'Not valid when row is a string' do
      expect { ChangeCommand.new.validate(bitmap, %w(L A 1 C)) }.to raise_error ValidationError
    end

    it 'Not valid when col is a string' do
      expect { ChangeCommand.new.validate(bitmap, %w(L 1 A C)) }.to raise_error ValidationError
    end
  end
end

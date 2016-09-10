# frozen_string_literal: true
require_relative '../../spec_helper.rb'

RSpec.describe VerticalCommand do
  let(:bitmap){Bitmap.new(5,6)}
  context '.execute' do 
    it 'creates a new Bitmap' do 
      described_class.new.execute(bitmap,"V 2 3 6 W")
      expect(bitmap.matrix).to contain_exactly(%w(O O O O O),
                                               %w(O O O O O),
                                               %w(O W O O O),
                                               %w(O W O O O),
                                               %w(O W O O O),
                                               %w(O W O O O))
    end
  end

  context '.validations' do
    it 'throws  ValidationError when run without bitmap' do
      expect { described_class.new.validate(nil, %w(V 2 3 6 W)) }.to raise_error ValidationError, 'You have to create a new bitmap first' 
    end
    it 'raise error when have less args' do
      expect { described_class.new.validate(bitmap, %w(V 2 6 W)) }.to raise_error ValidationError, 'Check your arguments'
    end
    it 'throws  ValidationError when has more args' do
      expect { described_class.new.validate(bitmap, %w(V 2 3 6 W P)) }.to raise_error ValidationError,'Check your arguments'
    end
    it 'fails when X is not valid' do
      expect { described_class.new.validate(bitmap, %w(V 8 3 6 W)) }.to raise_error ValidationError, 'Arg X is invalid'
    end
    it 'fails when Y1 is not valid' do
      expect { described_class.new.validate(bitmap, %w(V 2 10 6 W)) }.to raise_error ValidationError, 'Arg Y1 is invalid' 
    end
    it 'fails when Y2 is not valid' do
      expect { described_class.new.validate(bitmap, %w(V 2 3 10 W)) }.to raise_error ValidationError, 'Arg Y2 is invalid'
    end
  end
end

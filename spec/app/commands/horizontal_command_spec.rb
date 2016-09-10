# frozen_string_literal: true
require_relative '../../spec_helper.rb'

RSpec.describe HorizontalCommand do
  context '.execute' do 
    it 'creates a new Bitmap' do 
      bitmap = Bitmap.new(5,6)
      described_class.new.execute(bitmap,"H 3 5 2 Z")
      expect(bitmap.matrix).to contain_exactly(%w(O O O O O),
                                               %w(O O Z Z Z),
                                               %w(O O O O O),
                                               %w(O O O O O),
                                               %w(O O O O O),
                                               %w(O O O O O))
    end
  end

  context '.validations' do
    it 'throws  ValidationError when run without bitmap' do
      expect { described_class.new.validate(nil, %w(I N 1)) }.to raise_error ValidationError
    end
  end
end

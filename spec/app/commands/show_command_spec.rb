# frozen_string_literal: true

require_relative '../../spec_helper.rb'

RSpec.describe ShowCommand do

  context '.validations' do
    it 'raise validation error on nil bitmap' do 
      expect{ShowCommand.new.validate(nil)}.to raise_error ValidationError
    end
  end

  context '.run' do
    it 'show pixmap' do
      bitmap = Bitmap.new(1,2)
      expect { ShowCommand.new.run(bitmap) }.to output("OO\n").to_stdout
    end

    it 'show pixmap 2x1' do
      bitmap = Bitmap.new(2,1)
      expect { ShowCommand.new.run(bitmap) }.to output("O\nO\n").to_stdout
    end

    it 'show pixmap 3x2' do
      bitmap = Bitmap.new(3,2)
      expect { ShowCommand.new.run(bitmap) }.to output("OO\nOO\nOO\n").to_stdout
    end
  end
end
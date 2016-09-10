# frozen_string_literal: true
require_relative '../../spec_helper.rb'

RSpec.describe ChangeCommand do
  context '.execute' do 
   it 'creates a new Bitmap' do 
     bitmap = Bitmap.new(4,5)
     ChangeCommand.new.execute(bitmap, "L 1 1 C")
     expect(bitmap.matrix[0][0]).to eql 'C'

   end
  end

  context '.validations' do
    it 'throws  ValidationError if first parameter is not a Bitmap' do
      expect { ChangeCommand.new.validate(nil,%w(L 1 1 C)) }.to raise_error ValidationError
    end
  end
end

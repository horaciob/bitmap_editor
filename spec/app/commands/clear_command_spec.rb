# frozen_string_literal: true
require_relative '../../spec_helper.rb'

RSpec.describe ClearCommand do
  context '.execute' do
    it 'clear Bitmap' do
      bitmap = Bitmap.new(2, 2)
      described_class.new.execute(bitmap, 'C')
    end
  end

  context '.validations' do
    it 'throws  ValidationError when current_bitmap is nil' do
      expect { described_class.new.validate(nil, 'C') }.to raise_error ValidationError
    end
  end
end

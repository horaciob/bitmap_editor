# frozen_string_literal: true
require_relative '../../spec_helper.rb'

RSpec.describe ClearCommand do
  context '.execute' do
    it 'clear Bitmap' do
      bitmap = Bitmap.new(2, 2)
      allow(bitmap).to receive(:clear).once
      described_class.new.execute(bitmap, 'C')
    end

    it 'clear Bitmap even if more args are passed' do
      bitmap = Bitmap.new(2, 2)
      allow(bitmap).to receive(:clear).once
      described_class.new.execute(bitmap, 'C F A K E')
    end
  end

  context '.validations' do
    it 'throws  ValidationError when current_bitmap is nil' do
      expect { described_class.new.validate(nil, 'C') }.to raise_error ValidationError
    end
  end
end

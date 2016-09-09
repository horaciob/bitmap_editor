# frozen_string_literal: true
require_relative '../../spec_helper.rb'

RSpec.describe Bitmap do
  context '.new' do
    it 'returns a Bitmap' do
      expect(Bitmap.new(5,6)).to be_a_kind_of Bitmap
    end

    it 'returns a 2x2 matrix' do
      m = Bitmap.new(2,2)
      expect(m.matrix).to contain_exactly(%w(O O),
                                          %w(O O))
    end

    it 'returns a 2x3 matrix' do
      m = Bitmap.new(2, 3)
      expect(m.matrix).to contain_exactly(%w(O O O),
                                          %w(O O O))
    end
  end
end

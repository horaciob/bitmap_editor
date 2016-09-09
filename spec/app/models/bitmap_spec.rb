# frozen_string_literal: true
require_relative '../../spec_helper.rb'

RSpec.describe Bitmap do
  context '.new' do
    it 'returns a Bitmap' do
      expect(Bitmap.new(5,6)).to be_a_kind_of Bitmap
    end

    it 'returns a 2x2 matrix' do
      bitmap = Bitmap.new(2,2)
      expect(bitmap.matrix).to contain_exactly(%w(O O),
                                               %w(O O))
    end

    it 'returns a 2x3 matrix' do
      bitmap = Bitmap.new(2, 3)
      expect(bitmap.matrix).to contain_exactly(%w(O O O),
                                               %w(O O O))
    end
  end

  context '.clear' do 
    before :each do 
      @bitmap =  Bitmap.new(2,3) 
    end

    it 'clear all matrix to white(O)' do 
      @bitmap.matrix[0][1]='A'
      @bitmap.clear
      expect(@bitmap.matrix.flatten.uniq).to eq ['O']
    end

    it 'clear first value' do
      @bitmap.matrix[0][0]='A'
      @bitmap.clear
      expect(@bitmap.matrix.flatten.uniq).to eq ['O']
    end

    it 'clear last value' do
      @bitmap.matrix[2][3]='A'
      @bitmap.clear
      expect(@bitmap.matrix.flatten.uniq).to eq ['O']
    end
  end

  context '.change' do 
    before :each do 
      @bitmap =  Bitmap.new(2,3) 
    end

    it 'allows to change an element' do 
      @bitmap.change(1,2,'A')
      expect(@bitmap.matrix).to eq [['O','A','O'],
                                    ['O','O','O']]
    end

    it 'allows to change first element' do
      @bitmap.change(1,1,'A')
      expect(@bitmap.matrix).to eq [['A','O','O'],
                                    ['O','O','O']]
    end

    it 'allows to change last element' do 
      @bitmap.change(2,3,'A')
      expect(@bitmap.matrix).to eq [['O','O','O'],
                                    ['O','O','A']]
    end
  end
end

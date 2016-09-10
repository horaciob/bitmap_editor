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
      expect(bitmap.matrix).to contain_exactly(%w(O O ),
                                               %w(O O ),
                                               %w(O O))
    end
  end

  context '.clear' do 
    before :each do 
      @bitmap =  Bitmap.new(2,3) 
    end

    it 'clear all matrix to white(O)' do 
      @bitmap.change(0,1,'A')
      @bitmap.clear
      expect(@bitmap.matrix.flatten.uniq).to contain_exactly 'O'
    end

    it 'clear first value' do
      @bitmap.change(1,1,'A')
      @bitmap.clear
      expect(@bitmap.matrix.flatten.uniq).to contain_exactly 'O'
    end

    it 'clear last value' do
      @bitmap.change(2,3,'A')
      @bitmap.clear
      expect(@bitmap.matrix.flatten.uniq).to contain_exactly 'O'
    end
  end

  context '.change' do 
    before :each do 
      @bitmap =  Bitmap.new(2,3) 
    end

    it 'allows to change an element' do 
      @bitmap.change(1,2,'A')
      expect(@bitmap.matrix).to contain_exactly(%w(O O ),
                                                %w(A O ),
                                                %w(O O))
    end

    it 'allows to change first element' do
      @bitmap.change(1,1,'A')
      expect(@bitmap.matrix).to contain_exactly(%w(A O ),
                                                %w(O O ),
                                                %w(O O ))
    end

    it 'allows to change last element' do 
      @bitmap.change(2,3,'A')
      expect(@bitmap.matrix).to contain_exactly(%w(O O ),
                                                %w(O O ),
                                                %w(O A ))
    end
  end

  context('.horizontal_change') do
    before :each do 
      @bitmap=Bitmap.new(6,3)
    end
    it 'draws horizontal' do 
      @bitmap.horizontal_change(3,5,2,'C')
      expect(@bitmap.matrix).to contain_exactly(%w(O O O O O O),
                                                %w(O O C C C O),
                                                %w(O O O O O O))
    end

    it 'draws horizontal if init and finish are changed' do 
      @bitmap.horizontal_change(5,3,2,'C')
      expect(@bitmap.matrix).to contain_exactly(%w(O O O O O O),
                                                %w(O O C C C O),
                                                %w(O O O O O O))
    end
  end
  context('.vertical_change') do
    before :each do 
      @bitmap = Bitmap.new(3,6)
    end

    it 'draws vertical' do 
      @bitmap.vertical_change(2,2,4,'C')
      expect(@bitmap.matrix).to contain_exactly(%w(O O O),
                                                %w(O C O),
                                                %w(O C O),
                                                %w(O C O),
                                                %w(O O O),
                                                %w(O O O))
    end
    it 'draws vertical if values are changed' do 
      @bitmap.vertical_change(2,4,2,'C')
      expect(@bitmap.matrix).to contain_exactly(%w(O O O),
                                                %w(O C O),
                                                %w(O C O),
                                                %w(O C O),
                                                %w(O O O),
                                                %w(O O O))
    end
  end
  
  context('.valid_index?') do
    before(:each) do 
      @bitmap = Bitmap.new(2,3)
    end
    
    it '0,1 is invalid' do
      expect(@bitmap.valid_index?(0,1)).to be false 
    end
    it '1,0 is invalid' do
      expect(@bitmap.valid_index?(1,0)).to be false 
    end
    it '1,1 is valid' do
      expect(@bitmap.valid_index?(1,1)).to be true 
    end
    it '3,1 is valid' do
      expect(@bitmap.valid_index?(3,1)).to be true 
    end
    it '2,1 is valid' do 
      expect(@bitmap.valid_index?(2,1)).to be true 
    end
    it '3,2 is valid' do 
      expect(@bitmap.valid_index?(3,2)).to be true 
    end
    it '4,2 is invalid' do 
      expect(@bitmap.valid_index?(4,2)).to be false 
    end
    it '3,3 is invalid' do 
      expect(@bitmap.valid_index?(3,3)).to be false 
    end

    it 'Char A is invalid for row' do 
      expect(@bitmap.valid_index?('A',3)).to be false 
    end

    it 'A is invalid for columns' do 
      expect(@bitmap.valid_index?(3,'A')).to be false 
    end

  end
end

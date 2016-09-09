# frozen_string_literal: true
require_relative '../spec_helper.rb'

RSpec.describe Pixmap do
  context '.new' do
    let (:valid_input) { %w(I 5 6) }

    it 'returns a Pixmap' do
      expect(Pixmap.new(valid_input)).to be_a_kind_of Pixmap
    end

    it 'returns a 2x2 matrix' do
      m = Pixmap.new(%w(I 2 2))
      expect(m.matrix).to contain_exactly(%w(O O),
                                          %w(O O))
    end

    it 'returns a 2x3 matrix' do
      m = Pixmap.new(%w(I 2 3))
      expect(m.matrix).to contain_exactly(%w(O O O),
                                          %w(O O O))
    end

    context '.validations' do
      it 'throws  ValidationError when rows number isn\'t a number' do
        expect { Pixmap.new(%w(I N 1)) }.to raise_error ArgumentError
      end

      it 'throws  ValidationError when rows is 0' do
        expect { Pixmap.new(%w(I 0 5)) }.to raise_error ArgumentError
      end

      it 'throws  ValidationError when col number isn\'t a number' do
        expect { Pixmap.new(%w(I 5 N)) }.to raise_error ArgumentError
      end

      it 'throws ValidationError when columns is 0' do
        expect { Pixmap.new(%w(I 5 0)) }.to raise_error ArgumentError
      end
    end

    context '.show' do
      it 'show pixmap' do
        p = Pixmap.new(%w(I 1 2))
        expect { p.show }.to output("\nOO").to_stdout
      end
    end
  end
end

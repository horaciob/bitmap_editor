# frozen_string_literal: true
require_relative '../../spec_helper.rb'

RSpec.describe HorizontalCommand do
  let(:bitmap) { Bitmap.new(5, 6) }
  context '.execute' do
    it 'creates a new Bitmap' do
      described_class.new.execute(bitmap, 'H 3 5 2 Z')
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
      expect { described_class.new.validate(nil, %w(H 3 5 2 Z)) }
        .to raise_error ValidationError, 'You have to create a new bitmap first'
    end

    it 'fails when has more arguments than expeted' do
      expect { described_class.new.validate(bitmap, %w(H 3 5 2 Z E)) }
        .to raise_error ValidationError, 'Check your arguments'
    end
  end

  it 'fails when has less arguments' do
    expect { described_class.new.validate(bitmap, %w(H 5 2 Z)) }
      .to raise_error ValidationError, 'Check your arguments'
  end

  it 'fails when X1 is invalid' do
    expect { described_class.new.validate(bitmap, %w(H 7 5 2 Z)) }
      .to raise_error ValidationError, 'Arg X1 is invalid'
  end

  it 'fails when X2 is invalid' do
    expect { described_class.new.validate(bitmap, %w(H 3 7 2 Z)) }
      .to raise_error ValidationError, 'Arg X2 is invalid'
  end

  it 'fails when Y is invalid' do
    expect { described_class.new.validate(bitmap, %w(H 3 5 10 Z)) }
      .to raise_error ValidationError, 'Arg Y is invalid'
  end

  it 'fails when color is invalid' do
    expect { described_class.new.validate(bitmap, %w(H 3 5 2 1)) }
      .to raise_error ValidationError, 'Color is not valid'
  end
end

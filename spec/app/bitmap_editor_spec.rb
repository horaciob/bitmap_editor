# frozen_string_literal: true
require_relative '../spec_helper.rb'

RSpec.describe BitmapEditor do
  let(:console) { described_class.new }

  context '.exit_console' do
    it 'set running to false' do
      allow($stdout).to receive(:write)
      console.send(:exit_console)
      expect(console.instance_eval { @running }).to be false
    end
  end

  context '.run' do
    it 'runs exit command' do
      allow($stdout).to receive(:write) # this avoid to show sdout message while rspec runs
      allow(Readline).to receive(:readline) { 'X' }
      expect(console).to receive(:exit_console).and_call_original
      console.run
    end

    it 'runs create command' do
      allow($stdout).to receive(:write)
      allow(Readline).to receive(:readline).and_return('I 2 2', 'X')
      expect(CreateCommand).to receive(:new).and_return(instance_double(CreateCommand, execute: 0))
      console.run
    end

    it 'runs show command' do
      allow($stdout).to receive(:write)
      allow(Readline).to receive(:readline).and_return('S', 'X')
      expect(ShowCommand).to receive(:new).and_return(instance_double(ShowCommand, execute: 0))
      console.run
    end

    it 'runs Clear command' do
      allow($stdout).to receive(:write)
      allow(Readline).to receive(:readline).and_return('C', 'X')
      expect(ClearCommand).to receive(:new).and_return(instance_double(ClearCommand, execute: 0))
      console.run
    end

    it 'runs Change command' do
      allow($stdout).to receive(:write)
      allow(Readline).to receive(:readline).and_return('L 2 3 A', 'X')
      expect(ChangeCommand).to receive(:new).and_return(instance_double(ChangeCommand, execute: 0))
      console.run
    end

    it 'runs Vertical command' do
      allow($stdout).to receive(:write)
      allow(Readline).to receive(:readline).and_return('V 2 3 6 W', 'X')
      expect(VerticalCommand).to receive(:new).and_return(instance_double(VerticalCommand, execute: 0))
      console.run
    end

    it 'runs Horizontal Command' do
      allow($stdout).to receive(:write)
      allow(Readline).to receive(:readline).and_return('H 3 5 2 Z', 'X')
      expect(HorizontalCommand).to receive(:new).and_return(instance_double(HorizontalCommand, execute: 0))
      console.run
    end

    it 'show unknown command' do
      allow($stdout).to receive(:write)
      allow(Readline).to receive(:readline).and_return('FAKECOMMAND', 'X')
      expect { console.run }.to output(/unrecognised command/).to_stdout
    end

    it 'show help' do
      allow($stdout).to receive(:write)
      allow(Readline).to receive(:readline).and_return('?', 'X')
      expect { console.run }.to output(/\? - Help/).to_stdout
    end

    it 'show validations errors' do
      allow($stdout).to receive(:write)
      allow(HorizontalCommand).to receive(:new).and_raise(ValidationError, 'Ops an error!')
      allow(Readline).to receive(:readline).and_return('H 10 10 10 10', 'X')
      expect { console.run }.to output(/Ops an error!/).to_stdout
    end
  end
end

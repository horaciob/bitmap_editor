# frozen_string_literal: true
require 'bundler'
Bundler.require :default
require_relative 'commands/command.rb'
require_all 'app/models'
require_all 'app/commands'

# Bitmap console
class BitmapEditor
  def run
    @running = true
    puts 'type ? for help'
    current_bitmap = nil

    while @running
      begin
        print '> '
        input = gets.chomp
        input.strip!
        case input[0]
        when '?'
          show_help
        when 'X'
          exit_console
        when 'I'
          current_bitmap = CreateCommand.new.execute(current_bitmap, input)
        when 'S'
          ShowCommand.new.execute(current_bitmap, input)
        when 'C'
          ClearCommand.new.execute(current_bitmap, input)
        when 'L'
          ChangeCommand.new.execute(current_bitmap, input)
        when 'H'
          HorizontalCommand.new.execute(current_bitmap, input)
        when 'V'
          VerticalCommand.new.execute(current_bitmap, input)
        else
          puts 'unrecognised command :('
        end
      rescue ValidationError => e
        puts e.message
      end
    end
  end

  private

  def exit_console
    puts 'goodbye!'
    @running = false
  end

  def show_help
    puts "? - Help
I M N - Create a new M x N image with all pixels coloured white (O).
C - Clears the table, setting all pixels to white (O).
L X Y C - Colours the pixel (X,Y) with colour C.
V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
S - Show the contents of the current image
X - Terminate the session"
  end
end

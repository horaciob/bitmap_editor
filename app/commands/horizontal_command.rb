# frozen_string_literal: true

# Create Matrix command
class HorizontalCommand < Command
  def validate(bitmap, args)
    raise ValidationError, 'You have to create a new bitmap first' if bitmap.nil?
  end

  def run(bitmap, *args)
    bitmap.horizontal_change(*args[1..-1])
  end
end


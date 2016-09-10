# frozen_string_literal: true

# Create Matrix command
class VerticalCommand < Command
  def validate(bitmap, _args)
    raise ValidationError, 'You have to create a new bitmap first' if bitmap.nil?
  end

  def run(bitmap, *args)
    bitmap.vertical_change(*args[1..-1])
  end
end

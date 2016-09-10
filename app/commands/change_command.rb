# frozen_string_literal: true

# Create Matrix command
class ChangeCommand < Command
  def validate(current_bitmap, _args)
    raise ValidationError, 'You have to create a new bitmap first' if current_bitmap.nil?
  end

  def run(bitmap, *args)
    bitmap.change(*args[1..-1])
  end
end

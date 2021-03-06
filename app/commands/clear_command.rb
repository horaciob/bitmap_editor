# frozen_string_literal: true

# Create Matrix command
class ClearCommand < Command
  def validate(current_bitmap, *_args)
    raise ValidationError, "You have to create a new Bitmap with \'I\' command" unless current_bitmap
  end

  def run(current_bitmap, *_arg)
    current_bitmap.clear
  end
end

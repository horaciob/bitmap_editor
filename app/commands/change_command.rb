# frozen_string_literal: true

# Create Matrix command
class ChangeCommand < Command
  def validate(bitmap, args)
    raise ValidationError, 'Please check your arguments' if args.size != 4
    raise ValidationError, 'You have to create a new bitmap first' unless bitmap
    raise ValidationError, 'Wrong index for current bitmap' unless bitmap.valid_index?(args[1], args[2])
    raise ValidationError, 'Invalid color please try again' unless bitmap.valid_color?(args[3])
  end

  def run(bitmap, *args)
    bitmap.change(*args[1..-1])
  end
end

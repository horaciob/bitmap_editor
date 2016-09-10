# frozen_string_literal: true

# Create Matrix command
class HorizontalCommand < Command
  def validate(bitmap, args)
    raise ValidationError, 'Check your arguments' if args.size != 5
    raise ValidationError, 'You have to create a new bitmap first' unless bitmap
    raise ValidationError, 'Arg X1 is invalid' unless bitmap.valid_index?(1, args[1])
    raise ValidationError, 'Arg X2 is invalid' unless bitmap.valid_index?(1, args[2])
    raise ValidationError, 'Arg Y is invalid' unless bitmap.valid_index?(args[3])
    raise ValidationError, 'Color is not valid' unless bitmap.valid_color?(args[4])
  end

  def run(bitmap, *args)
    bitmap.horizontal_change(*args[1..-1])
  end
end

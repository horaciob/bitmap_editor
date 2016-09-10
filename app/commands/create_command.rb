# frozen_string_literal: true

# Create Matrix command
class CreateCommand < Command
  def validate(_current_bitmap, args)
    raise ValidationError, '\'I\' command receive 3 args : \'I 5 3\'' if args.size != 3
    begin
      Integer(args[1])
      Integer(args[2])

    rescue ArgumentError
      raise ValidationError, 'rows and columns must be a number'
    end

    raise ValidationError, 'Rows must be grater than 0' if args[1].to_i <= 0
    raise ValidationError, 'Columns must be grater than 0' if args[2].to_i <= 0
  end

  def run(_current_bitmap, *args)
    Bitmap.new(args[1].to_i, args[2].to_i)
  end
end

class ValidationError < StandardError
end

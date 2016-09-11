# frozen_string_literal: true

# show command
class ShowCommand < Command
  def validate(bitmap, _args)
    raise ValidationError, 'You have to create a new Image with command I' unless bitmap
  end

  def run(bitmap, *_args)
    bitmap.matrix.each do |row|
      row.each do |col|
        print col.to_s
      end
      print "\n"
    end
  end
end

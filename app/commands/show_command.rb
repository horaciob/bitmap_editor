# frozen_string_literal: true

# show command
class ShowCommand < Command
  def validate(bitmap)
    raise ValidationError, 'You have to create a new Image with command I' if bitmap.nil?
  end

  def run(bitmap)
    bitmap.matrix.each do |row|
      row.each do |col|
        print col.to_s
      end
      print "\n"
    end
  end
end

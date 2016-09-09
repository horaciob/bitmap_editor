# frozen_string_literal: true

# Bitmap model
class Bitmap
  attr_accessor :matrix
  def initialize(rows, columns)
    @rows = rows.to_i
    @columns = columns.to_i
    @matrix = []
    @rows.times do
      @matrix << Array.new(@columns, 'O') 
    end
  end
  
  def clear
    @matrix.each_with_index  do |row, row_index|
      row.each_with_index  do |column,col_index|
        @matrix[row_index,col_index] = 'O'
      end
    end
  end

end

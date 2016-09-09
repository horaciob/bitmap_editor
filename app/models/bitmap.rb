# frozen_string_literal: true

# Bitmap model
class Bitmap
  attr_reader :matrix, :rows, :columns
  def initialize(rows, columns)
    @rows = rows.to_i
    @columns = columns.to_i
    @matrix = []
    @rows.times do
      @matrix << Array.new(@columns, 'O')
    end
  end

  def clear
    @matrix.each_with_index do |row, row_index|
      row.each_with_index do |_column, col_index|
        @matrix[row_index, col_index] = 'O'
      end
    end
  end

  def change(row, column, value)
    row -= 1
    column -= 1
    @matrix[row][column] = value
  end

  def vertical_change(row, from, to, value)
    row -= 1
    r = range(from, to)
    @matrix[row].fill(value, r)
  end

  def range(first, second)
    first -= 1
    second -= 1
    if first > second
      aux = first
      first = second
      second = aux
    end
    first..second
  end
end

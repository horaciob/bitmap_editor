# frozen_string_literal: true

# Bitmap model
class Bitmap
  attr_reader :matrix
  def initialize(rows, columns)
    @rows = rows.to_i
    @columns = columns.to_i
    @matrix = Array.new(@rows, Array.new(@columns, 'O'))
  end
end

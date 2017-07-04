# write a function that takes in a square matrix and rotates it 90 degrees
# clockwise, in place.

def rotate_matrix(matrix)
  return matrix if matrix.length <= 1
  len = matrix.length - 1
  len.times do |i|
    matrix[0][i], matrix[i][len], matrix[len][len - i], matrix[len - i][0] =
      matrix[len - i][0], matrix[0][i], matrix[i][len], matrix[len][len - i]
  end
  return if len == 1
  inner_matrix = Array.new(len - 1) { Array.new }
  (1...len).each do |row|
    (1...len).each do |col|
      inner_matrix[row - 1] << matrix[row][col]
    end
  end
  rotate_matrix(inner_matrix)
  (1...len).each do |row|
    (1...len).each do |col|
      matrix[row][col] = inner_matrix[row - 1][col - 1]
    end
  end
end

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

def rotate_matrix(matrix)
  matrix_size = matrix.length - 1
  (0...matrix.length / 2).each do |row|
    (row...matrix_size - row).each do |col|
      matrix[row][col],
      matrix[~col][row],
      matrix[~row][~col],
      matrix[col][~row] = matrix[~col][row],
                          matrix[~row][~col],
                          matrix[col][~row],
                          matrix[row][col]
    end
  end
end

##### just for kicks, there's a non-in-place version that's easier ####

def make_rotated(matrix)
  matrix_size = matrix.length - 1
  new_matrix = Array.new(matrix.length) { Array.new }
  (0..matrix_size).each do |row|
    (0..matrix_size).each do |col|
      new_matrix[col] << matrix[row][col]
    end
  end
  new_matrix
end

p make_rotated([[1, 2, 3, 4, 5], [6, 7, 8, 9, 0], [1, 2, 3, 4, 5], [6, 7, 8, 9, 0], [1, 2, 3, 4, 5]])

require 'rspec'
require 'rotate_matrix'

describe '#rotate_matrix' do
  context "on an empty array" do
    it "does nothing" do
      matrix_1 = []
      rotate_matrix(matrix_1)
      expect(matrix_1).to eq([])
    end
  end

  context "on arrays where the middle doesn't shift" do
    it "rotates a 2x2 array" do
      matrix_2 = [[1, 2], [3, 4]]
      rotate_matrix(matrix_2)
      expect(matrix_2).to eq([[3, 1], [4, 2]])
    end

    it "rotates a 3x3 array" do
      matrix_3 = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
      rotate_matrix(matrix_3)
      expect(matrix_3).to eq([[7, 4, 1], [8, 5, 2], [9, 6, 3]])
    end
  end

  context "on arrays where there is recursion" do
    it "rotates a 4x4 array" do
      matrix_4 = [[1, 2, 3, 4], [5, 6, 7, 8], [9, 0, 1, 2], [3, 4, 5, 6]]
      rotate_matrix(matrix_4)
      expect(matrix_4).to eq([[3, 9, 5, 1], [4, 0, 6, 2], [5, 1, 7, 3], [6, 2, 8, 4]])
    end

    it "rotates a 5x5 array" do
      matrix_5 = [[1, 2, 3, 4, 5], [6, 7, 8, 9, 0], [1, 2, 3, 4, 5], [6, 7, 8, 9, 0], [1, 2, 3, 4, 5]]
      rotate_matrix(matrix_5)
      expect(matrix_5).to eq([[1, 6, 1, 6, 1], [2, 7, 2, 7, 2], [3, 8, 3, 8, 3], [4, 9, 4, 9, 4], [5, 0, 5, 0, 5]])
    end
  end
end

# frozen_string_literal: true

# Set of methods for manipulating vectors and matrices
module Vector
  # "setblock 0 50 0 concrete 15" => [0, 50, 0, "concrete 15"]
  def self.to_vector(command)
    coordinates = command.split(' ')[1..3].map(&:to_i)
    block = command.split(' ')[-2..].join(' ')

    coordinates.push(block)
  end





  # [[0,50,0,"block 0"],[1,50,0,"block 0"],...]
  # => [[0,1,50,0,"block 0"]]
  # matrix -> matrix
  def self.compact(vectors)
    # matrix of vectors
    matrix = Array.new(vectors.length)

    i = 0 # control the change of block
    vec = Array.new(5) # buffer for list_of_vectors

    index = 0
    vectors.each_cons(2) do |current_vec, next_vec|
      vec = [current_vec[0], nil, current_vec[2], nil, nil] if i.zero?

      begin
        # same block
        if current_vec[3] == next_vec[3]
          *vec[1..4] = *next_vec[0..3]
          i = 1
        else # next block
          matrix[index] = vec
          i = 0
        end
      rescue
        # when the list is odd
        matrix[index] = vec
        *vec[1..4] = *current_vec[0..3]
        i = 0
      end
      index += 1
    end

    matrix.compact
  end
end

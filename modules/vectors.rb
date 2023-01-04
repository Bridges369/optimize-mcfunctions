module Vector

  # "setblock 0 50 0 concrete 15" => [0, 50, 0, "concrete 15"]
  def self.to_vector(command)
    coordinates = command.split(' ')[1..3].map {|e|e.to_i}
    block = command.split(' ')[-2..-1].join(' ')

    return coordinates.push(block)
  end  
  




  # [[0,50,0,"block 0"],[1,50,0,"block 0"],...]
  # => [[0,1,50,0,"block 0"]]
  def self.compact(vectors)

    # storage list of final vectors
    list_of_vectors = Array.new(vectors.length)


    i = 0 # control the change of block
    vec = Array.new(5) # buffer for list_of_vectors

    vectors.each_with_index do |current_vec, index|
      next_vec = vectors[index + 1]
      if i==0 
        vec = [current_vec[0], nil, current_vec[2], nil, nil] 
      end

      begin
        # same block
        if current_vec[3] == next_vec[3]
          *vec[1..4] = *next_vec[0..3]
          i = 1
        else # next block
          list_of_vectors[index] = vec
          i = 0
        end
      rescue
          # when the list is odd
          list_of_vectors[index] = vec
          *vec[1..4] = *current_vec[0..3]
          i = 0
      end
    end   

    return list_of_vectors.compact
      
  end

end

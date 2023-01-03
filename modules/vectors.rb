module Vector

  # "setblock 0 50 0 concrete 15" => [0, 50, 0, "concrete 15"]
  def self.to_vector(command)
    coordinates = command.split(' ')[1..3].map {|e|e.to_i}
    block = command.split(' ')[-2..-1].join(' ')

    return coordinates.push(block)
  end  
  
  # [[0,50,0,"block 0"],[1,50,0,"block 0"],...]
  # => [[0,1,50,0,"block 0"]]
  def self.compact(vec)

  end

end

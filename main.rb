# frozen_string_literal: true

start = Time.new
require_relative 'modules/commands'
require_relative 'modules/vectors'
require_relative 'classes/array'

require_relative 'tests/run_all'

file = IO.readlines('frames/frame.mcfunction')
WIDTH = 2
HEIGTH = 5

# create empity elements for memory save
frame_matrix = Array.new(file.length)

file.each_slice(HEIGTH) do |chunck|
  chunck
    .to_vector
    .compact_matrix
    .to_command
end


frame_matrix.compact!

p Time.new - start

__END__
=begin
[ lenght: WIDTH
  [ lenght: HEIGHT
    [nil, nil, nil], 
    [nil, nil, nil], 
    ...
  ],
  [
    ...
  ],
  ...
]
=end
filled_columns = Array.new(WIDTH) {Array.new(HEIGHT)}

p filled_columns

IO.readlines("./frame.mcfunction").each do |line|
  p line
end

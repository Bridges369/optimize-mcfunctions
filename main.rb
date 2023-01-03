require_relative 'modules/optimize'

WIDTH = 2         # z
HEIGHT = 5        # x
DEFAULT_Y = 50    # y

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
filled_columns = Array.new(WIDTH) do 
  Array.new(HEIGHT) {Array.new(3, nil)}
end

p filled_columns

IO.readlines("./frame.mcfunction").each do |line|
  p line
end

require_relative 'modules/optimize'

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

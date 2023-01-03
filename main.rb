module Optmize
  # Constants
  WIDTH = 2         # z
  HEIGHT = 5        # x
  DEFAULT_Y = 50    # y

  # Methods

  # z, Vec[x0, x1, block] => /fill || /setblock
  # 0, [0, 2, concrete 15] => "fill 0 50 0 2 50 0 concrete 15"
  # 1, [5, 5, concrete 0]  => "setblock 5 50 1 concrete 0"
  def eval(z_coord, *args)
    if args[0] == args[1]
      return "setblock #{args[0]} #{DEFAULT_Y} #{z_coord} #{args[2]}"
    end
    
    return "fill #{args[0]} #{DEFAULT_Y} #{z_coord} " \
                "#{args[1]} #{DEFAULT_Y} #{z_coord} #{args[2]}"

  end
end





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

__END__
IO.readlines("./frame.mcfunction").each do |line|
  p line
end

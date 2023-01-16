# frozen_string_literal: true

# Set of methods for manipulating commands
module Command
  # Constants

  # Methods

  # [x0, x1, y, z, block] => /fill || /setblock
  # [0, 2, 50, 0, "concrete 15"] => "fill 0 50 0 2 50 0 concrete 15"
  # [5, 5, 50, 0, "concrete 0"]  => "setblock 5 50 1 concrete 0"
  def self.to_command(vec)
    return "setblock %1d %1d %1d %1s" % vec[1..] if vec[0] == vec[1]

    return "fill %1d %1d %1d %1d %1d %1d %1s" % [
      vec[0], *vec[2..3], vec[1], *vec[2..]
    ]
  end
end

# frozen_string_literal: true

# set methods for manipulating vectors and matrices
class Array
  include Vector
  include Command

  def to_vector
    self.map! { |cmd| Vector.to_vector(cmd) }
  end

  def compact_matrix
    Vector.compact(self)
  end

  def to_command
    self.map! { |vec| Command.to_command(vec) }
  end
end

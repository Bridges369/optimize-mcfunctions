# Este módulo serve para otimizar e diminuir o número de comandos dentro de arquivos 'mcfunction'
#
# WARING: A entrada deve ser um Array em que cada elemento é um comando 'setblock' com as mesmas coordenadas 'y' e 'z'.
# 
# Array -> Array
module OptimizeSingleFile

  ###########
  # VECTORS #
  ###########

  # "setblock 0 50 0 concrete 15" => [0, 50, 0, "concrete 15"]
  def to_vector(command)
    coordinates = command.split(' ')[1..3].map(&:to_i)
    block = command.split(' ')[-2..].join(' ')
    coordinates.push(block)
  end

  # [[0,50,0,"block 0"],[1,50,0,"block 0"],...]
  # => [[0,1,50,0,"block 0"]]
  # matrix -> matrix
  def compact_matrix(vectors, delta_coordinate)
    # matrix of vectors
    matrix = Array.new(vectors.length)

    i = 0 # control the change of block
    vec = Array.new(5) # buffer for list_of_vectors

    vectors.each_with_index do |current_vec, index|
      next_vec = vectors[index + 1]
      vec = (delta_coordinate==:x ? [ # when the coord. z is static on current chunk
        current_vec[0], 
        nil, 
        current_vec[2],
        nil, 
        nil
      ] : [ # when the coord. x is static on the current chunk
        current_vec[2],
        current_vec[0],
        nil,
        nil,
        nil
      ]) if i.zero?

      begin
        # same block 
        if current_vec[3] == next_vec[3]
          delta_coordinate==:x ?
            (*vec[1..4] = *next_vec[0..3])
            : (*vec[2..4] = *next_vec[1..3])
          i = 1
        else # next block
          *vec[1..4] = *current_vec[0..3]
          matrix[index] = vec
          i = 0
        end
      rescue
        # when the list is odd
        matrix[index] = vec
        *vec[1..4] = *current_vec[0..3]
        i = 0
      end
    end

    matrix.compact
  end

  ############
  # COMMANDS #
  ############

  # [x0, x1, y, z, block] => /fill || /setblock
  # [0, 2, 50, 0, "concrete 15"] => "fill 0 50 0 2 50 0 concrete 15"
  # [5, 5, 50, 0, "concrete 0"]  => "setblock 5 50 1 concrete 0"
  def to_command(vec, delta_coordinate)
      return "setblock %1d %1d %1d %1s" % vec[1..] \
        if vec[0] == vec[delta_coordinate == :x ? 1 : 3]

      return "fill %1d %1d %1d %1d %1d %1d %1s" % if delta_coordinate == :x
        [ vec[0], *vec[2..3], vec[1], *vec[2..] ] 
      else 
        [ *vec[1..2], vec[0], *vec[1..2], *vec[3..] ]
      end
  end

end

# Controla a compatibilidade da entrada e saída
class Array
  include OptimizeSingleFile

  def optimize_setblock_array(delta_coordinate = :x)
    tmp = self.map { |command| to_vector(command) } # Matrix[cmds] -> Matrix[vecs]
    tmp = compact_matrix(tmp, delta_coordinate)                       # Matrix[vecs] -> Matrix[optimized_vecs]
    return tmp.map { |vec| to_command(vec, delta_coordinate) }        # Matrix[optimezed_vecs] -> Matrix[cmds]
  end

end

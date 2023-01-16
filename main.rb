# frozen_string_literal: true

start = Time.new

# Sanitize the arguments
# require 'args_parser'
# require_relative 'modules/args'
require_relative 'modules/commands'
require_relative 'modules/vectors'
require_relative 'classes/array'
require 'test/unit'
require_relative 'tests/run_all'

# Local que é armazenado os arquivos de functions
PATH = "frames"
# Nome do arquivo de functions
FILE_NAME = "frame.mcfunction"
# Se esta opção for verdadeira, ele criara um novo arquivo com o conteúdo gerado, caso contrário sobrescreverá o original.
CREATE_NEW_FILE = true

WIDTH = 2
HEIGTH = 5

file = IO.readlines(File.join(PATH, "/", FILE_NAME))
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

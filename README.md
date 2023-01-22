# Implementation

this script accepts as a parameter an array of 'setblock' commands that have immutable y and z coordinates throughout the array

```ruby
require_relative './OptimizeSingleFile'

file = <<~MCFUNCTION
  setblock 0 50 0 concrete 15
  setblock 1 50 0 concrete 0
  setblock 2 50 0 concrete 0
  setblock 3 50 0 concrete 15
  setblock 4 50 0 concrete 15
  setblock 0 50 1 concrete 15
  setblock 1 50 1 concrete 15
  setblock 2 50 1 concrete 15
  setblock 3 50 1 concrete 0
  setblock 4 50 1 concrete 0
MCFUNCTION

LENGTH = 5 # there are 5 blocks of x for every 1 block of z
new_file = Array.new

file.split("\n").each_slice(LENGTH) do |chunk|
    new_file.push(
    # the argument can be :x or :z according to the coordinate that varies in the chunk
    chunk.optimize_setblock_array(:x)
  )
end

# Normalize the array
new_file = [].concat(*new_file)
```

## Result

### `file` content
```ruby
[
  "setblock 0 50 0 concrete 15",
  "setblock 1 50 0 concrete 0",
  "setblock 2 50 0 concrete 0",
  "setblock 3 50 0 concrete 15",
  "setblock 4 50 0 concrete 15",
  "setblock 0 50 1 concrete 15",
  "setblock 1 50 1 concrete 15",
  "setblock 2 50 1 concrete 15",
  "setblock 3 50 1 concrete 0",
  "setblock 4 50 1 concrete 0"
]
```
### `new_file` content
```ruby
[
  "setblock 0 50 0 concrete 15",
  "fill 1 50 0 2 50 0 concrete 0",
  "fill 3 50 0 4 50 0 concrete 15",
  "fill 0 50 1 2 50 1 concrete 15",
  "fill 3 50 1 4 50 1 concrete 0"
]
```

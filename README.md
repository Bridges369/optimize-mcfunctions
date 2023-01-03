# COMMANDS SINTAX
- setblock sintax:
```
/setblock <coord: x, y, z> <block: block_name> <<id: block_id>
```

- fill sintax:
```
/fill <from: x, y, z> <to: x, y, z> <block: block_name> <id: block_id>
```

# RESULT

* FROM file: frame.mcfunctio
```mcfunction
setblock 0 50 0 concrete 15
setblock 1 50 0 concrete 0
setblock 2 50 0 concrete 0
setblock 3 50 0 concrete 15
setblock 4 50 0 concrete 15
setblock 0 50 1 concrete 15
setblock 1 50 1 concrete 15
setblock 2 50 1 concrete 15
setblock 3 50 1 concrete 0
setblock 4 50 0 concrete 0
```

* TO   file: frame.json
```json
[
//        fill_1               fill_2              fill_3  
  [ [0,2, concrete 15] , [3,4, concrete 0] , [5,5, concrete 15] ],    // z0
      
//  [ <from: x> , <to: x> , <block: name + id> ] , [..]
  [ [0,1, concrete 15]                           , [2,5, concrete 0]  // z1
]
```


# SAVES

```ruby
arr = ['foo', 0, nil, 'bar', 7, 'baz', nil]
arr.compact  #=> ['foo', 0, 'bar', 7, 'baz']
arr          #=> ['foo', 0, nil, 'bar', 7, 'baz', nil]
arr.compact! #=> ['foo', 0, 'bar', 7, 'baz']
arr          #=> ['foo', 0, 'bar', 7, 'baz']
```

```ruby
class Thing
  def square(n)
    n*n
  end
end
thing = Thing.new
meth  = thing.method(:square)

meth.call(9)                 #=> 81
[ 1, 2, 3 ].collect(&meth)   #=> [1, 4, 9]

[ 1, 2, 3 ].each(&method(:puts)) #=> prints 1, 2, 3

require 'date'
%w[2017-03-01 2017-03-02].collect(&Date.method(:parse))
#=> [#<Date: 2017-03-01 ((2457814j,0s,0n),+0s,2299161j)>, #<Date: 2017-03-02 ((2457815j,0s,0n),+0s,2299161j)>]
```

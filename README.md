# Commands syntax
- `setblock` syntax:
```
/setblock <position: x y z> <tileName: Block> [tileData: int]
```

- `fill` syntax:
```
/fill <from: x y z> <to: x y z> <tileName: Block> [tileData: int]
```

# Result

* From:
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

* To:
```mcfunction
# default coord. y: 50
setblock 0 50 0 concrete 15
fill 1 50 0 2 50 0 concrete 0
fill 3 50 0 4 50 0 concrete 15
fill 0 50 1 2 50 1 concrete 15
fill 3 50 1 4 50 1 concrete 0
```

# Saved examples

Here are examples taken from the [official Ruby documentation](https://ruby-doc.org)

3.1.2/Array
```ruby
arr = ['foo', 0, nil, 'bar', 7, 'baz', nil]
arr.compact  #=> ['foo', 0, 'bar', 7, 'baz']
arr          #=> ['foo', 0, nil, 'bar', 7, 'baz', nil]
arr.compact! #=> ['foo', 0, 'bar', 7, 'baz']
arr          #=> ['foo', 0, 'bar', 7, 'baz']
```


3.1.2/Module
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

3.1.2/String
```rb
# With keyword capacity, returns a copy of str; the given capacity may set the size of the internal buffer, which may affect performance:

String.new(capacity: 1) # => ""
String.new(capacity: 4096) # => ""
```


- [Unit test](https://en.wikibooks.org/wiki/Ruby_Programming/Unit_testing)

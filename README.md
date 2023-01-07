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

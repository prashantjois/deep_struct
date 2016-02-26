Deepstruct
==========

An adapter that wraps common ruby data-structures and makes them look like proper Objects.

```ruby
deep_struct = DeepStruct.new({ a: { b: 'c' } })
deep_struct.a.b
  => "c"
```

Usage
=====

Initialize with a hash as you with ostruct:

```ruby
deep_struct = DeepStruct.new({ a: { b: 'c' } })
deep_struct.a.b
  => "c"
```

Hash can be nested as deeply as you wish, including array parameters:

```ruby
deep_struct = DeepStruct.new({ a: { b: [ 'c', 'd', 'e' ] } })
deep_struct.a.b
  => ["c", "d", "e"]
deep_struct.a.b[1]
  => "d"
```

You can also write back through the wrapper with indifferent access

```ruby
deep_struct = DeepStruct.new({:a => 1, "b" => 2})
```

If DeepStruct is getting in your way, you can always get access to the raw content:

```ruby
deep_struct = Deepstruct.new(hello: world)
deep_struct.to_h
  => {:hello=>"world"}
```
  
You can assign any parameters in the structure as well, as you would a set of nested objects and attributes

```ruby
deep_struct = Deepstruct.new(a: { b: { c: [ 1,2,3] } })
deep_struct.a.b.c[0] = 7
deep_struct.to_h
  => {:a=>{:b=>{:c=>[7, 2, 3]}}}

deep_struct.a = 'test'
deep_struct.to_h
  => {:a=>"test"}
```

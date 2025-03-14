require "pattern_match"

class ExampleData < PatternMatch::Data
end

class ExampleTypeNoParams
  def foo(x)
    x
  end
end

class ExampleTypeSingleParam
  def initialize(x)
    @x = x
  end

  def bar(y)
    @x + y
  end
end

class ExampleTypeMultiParams
  def initialize(a, b)
    @a = a
    @b = b
  end

  def baz(x)
    [@a, @b, x]
  end
end

ExampleData.define_type(ExampleTypeNoParams)
ExampleData.define_type(ExampleTypeSingleParam)
ExampleData.define_type(ExampleTypeMultiParams)

e1 = ExampleTypeNoParams.new
e2 = ExampleTypeSingleParam.new(1)
e3 = ExampleTypeMultiParams.new(:a, :b)

pm = ExampleData
     .match
     .of(ExampleTypeNoParams).then(->(x) { x.foo(1) })
     .of(ExampleTypeSingleParam).then(->(x) { x.bar(10) })
     .otherwise(-> { 'otherwise branch' })

raise 'e1' unless pm.eval(e1) == 1
raise 'e2' unless pm.eval(e2) == 11
raise 'e3' unless pm.eval(e3) == 'otherwise branch'

require 'pattern_match'

class SumAnimal < PatternMatch::Data; end


class Dog
  def initialize(name, royalty)
    @name = name
    @royalty = royalty
  end

  def run
    "#{@name} is running"
  end
end

class Cat
  def initialize(name, age, cuteness)
    @name = name
    @age = age
    @cuteness = cuteness
  end

  def meow
    "#{@name} vox: meow"
  end
end

class Fish
  def initialize(edible)
    @edible = edible
  end

  def swim
    "swim swim... I'm #{@edible}"
  end
end

class Cow
  def walk
    'nice ranch'
  end
end

class Plane; end

SumAnimal.define_types(
  Dog,
  Cat,
  Fish,
  Cow
)

pattern_match = SumAnimal.match
                         .of(Dog).then(->(dog) { dog.run })
                         .of(Cat).then(->(cat) { cat.meow })
                         .otherwise(->{ 'blah, blah' }) # You can set fallback as saame as `else` of `if ... else`

raise unless pattern_match.eval(Dog.new('toby', 100)) == 'toby is running'
raise unless pattern_match.eval(Cow.new) == 'blah, blah'

# * You can't pass any types which excluded from SumAnimal as a patterhn matching branch.
# pattern_match.of(Plane) # Error at runtime
#
# * You can't pass any instances of types which excluded from SumAnimal as patttern maching evaluator.
# pattern_match.eval('this is not member' because String') # Error at runtime
#
# More specs are defined as test cases, please refer those.

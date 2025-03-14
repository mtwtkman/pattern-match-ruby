require "pattern_match"

class DataA < PatternMatch::Data; end

class X; end
class Y; end

DataA.define_type(X)
DataA.define_type(Y)
pm = DataA.match.of(X).then(->(x) { x })

begin
  pm.eval(X.new)
rescue PatternMatch::Error::BranchNotSatisfiedError
  exit 0
else
  raise
end

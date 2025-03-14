require "pattern_match"

class DataA < PatternMatch::Data; end
class X; end
DataA.define_type(X)
class Y; end

begin
  DataA.match.of(Y).then (->(_) { 'expected error' })
rescue PatternMatch::Error::UnknownTypeError
  exit 0
else
  raise
end

require 'pattern_match'

class DataA < PatternMatch::Data; end

class X; end

DataA.define_type(X)
pm = DataA.match.of(X).then(->(_) { 'hi' })

begin
  pm.eval('x')
rescue PatternMatch::Error::UnknownBranchError
  exit 0
else
  raise
end

require "pattern_match"

class DataA < PatternMatch::Data; end

class X; end

DataA.define_type(X)

tree = DataA.match.of(X).then(->(_) { 'hi' })

begin
  tree.of(X)
rescue PatternMatch::Error::DuplicatedBranchError
  exit 0
else
  raise
end

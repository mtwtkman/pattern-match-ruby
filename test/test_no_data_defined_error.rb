require "pattern_match"

class DataA < PatternMatch::Data; end

begin
  DataA.match
rescue PatternMatch::Error::NoDataDefinedError
  exit 0
else
  raise
end

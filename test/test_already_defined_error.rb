require "pattern_match"

class DataA < PatternMatch::Data
end

class Type1
end

class Type2
end

DataA.define_type(Type1)
DataA.define_type(Type2)

begin
  DataA.define_type(Type1)
rescue PatternMatch::Error::AlreadyDefinedError
  exit 0
else
  raise
end

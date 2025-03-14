require "pattern_match"

class DataA < PatternMatch::Data
end

class TypeA
end

DataA.define_type(TypeA)

class DataB < PatternMatch::Data
end

class TypeB
end

DataB.define_type(TypeB)

raise unless DataA.owned_types == [TypeA]
raise unless DataB.owned_types == [TypeB]

require "pattern_match"

class DataA < PatternMatch::Data; end

class X; end
class Y; end

DataA.define_types(X, Y)

raise unless DataA.owned_types == [X, Y]

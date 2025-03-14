module PatternMatch
  module Error
    class PatternMatchBaseError < StandardError; end
    class NoDataDefinedError < PatternMatchBaseError; end
    class UnknownTypeError < PatternMatchBaseError; end
    class AlreadyDefinedError < PatternMatchBaseError; end
    class DuplicatedBranchError < PatternMatchBaseError; end
    class BranchNotSatisfiedError < PatternMatchBaseError; end
    class UnknownBranchError < PatternMatchBaseError; end
  end
end

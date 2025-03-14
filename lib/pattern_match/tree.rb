require_relative "./error"

module PatternMatch
  class Tree
    def initialize(data)
      @data = data
      @branch_map = {}
    end

    def activate
      self
    end

    def of(type)
      raise Error::UnknownTypeError unless @data.has?(type)
      raise Error::DuplicatedBranchError if @branch_map.keys.include?(type)

      @branch_map[type] = Branch.new(self)
    end

    def otherwise(callback)
      @otherwise_callback = ->(_) { callback.call }
      self
    end

    def eval(obj)
      filled = (@data.owned_types - @branch_map.keys).empty?
      raise Error::BranchNotSatisfiedError if !filled && @otherwise_callback.nil?

      callback = @branch_map.fetch(obj.class, @otherwise_callback)
      raise Error::UnknownBranchError if callback.nil?

      callback.call(obj)
    end
  end
end

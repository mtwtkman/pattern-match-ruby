module PatternMatch
  class Branch
    def initialize(back_to)
      @back_to = back_to
    end

    def then(procedure)
      @procedure = procedure
      @back_to
    end

    def call(obj)
      @procedure.call(obj)
    end
  end
end

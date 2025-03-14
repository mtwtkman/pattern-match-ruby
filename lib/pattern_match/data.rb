require 'singleton'
require_relative "./error"
require_relative "./tree"
require_relative "./branch"

module PatternMatch
  class Data
    include Singleton

    def self.inherited(subclass)
      subclass.class_variable_set(:@@types, [])

      def subclass.define_type(type)
        raise Error::AlreadyDefinedError if has?(type)

        class_variable_set(:@@types, owned_types << type)
      end

      def subclass.define_types(*types)
        types.each { define_type(it) }
      end

      def subclass.owned_types
        class_variable_get(:@@types)
      end

      def subclass.match
        raise Error::NoDataDefinedError if owned_types.empty?
        Tree.new(self)
      end

      def subclass.has?(klass)
        owned_types.include?(klass)
      end
    end
  end
end

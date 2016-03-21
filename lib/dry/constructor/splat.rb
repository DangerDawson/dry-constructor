module Dry
  class Constructor
    class Splat < Module
      # Initialize a splat constructor module with the given accessors
      #
      # Create a new constructor module for inclusion
      #
      # @param [Array<Symbol|String>] accessors
      #   The names of the accessor methods that will be added when included
      # @param [Symbol|String] visibility
      #   The visibility of the accessor methods added on inclusion
      #
      # @return [Dry::Constructor]
      #
      # @api private
      def initialize(*accessors, visibility: :private)
        define_included(accessors, visibility)
        define_initializer(accessors)
        freeze
      end

      private

      # @api private
      def define_included(accessors, visibility)
        define_singleton_method(:included) do |descendant|
          super(descendant)
          descendant.__send__(:attr_reader, *accessors)
          descendant.__send__(visibility, *accessors)
        end
      end

      # @api private
      def define_initializer(accessors)
        define_method(:initialize) do |*args, &_block|
          accessors.zip(args).each do |key, value|
            instance_variable_set("@#{key}", value)
          end
        end
      end
    end
  end
end

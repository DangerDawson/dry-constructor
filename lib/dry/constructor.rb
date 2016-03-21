require 'dry/constructor/hash'
require 'dry/constructor/kwargs'
require 'dry/constructor/splat'
require 'dry/constructor/version'

# A collection of micro-libraries, each intended to encapsulate
# a common task in Ruby
module Dry
  # Create a new module to include and define an initializer for DI
  # - accessors will be private
  #
  # @example
  #   class Controller
  #     include Dry::Constructor(:request, :response)
  #   end
  #
  # @param [Array<Symbol|String>] accessors
  #   The names of the accessor methods that will be added when included
  #
  # @return [Dry::Constructor]
  #
  # @api public
  def self.Constructor(*accessors, visibility: :private)
    ::Dry::Constructor::Splat(*accessors, visibility: visibility)
  end

  # A simple dependency injection library for Plain Old Ruby Objects
  class Constructor
    def self.Splat(*accessors, visibility: :private)
      ::Dry::Constructor::Splat.new(*accessors, visibility: visibility)
    end

    def self.Hash(*accessors, visibility: :private)
      ::Dry::Constructor::Hash.new(*accessors, visibility: visibility)
    end

    def self.Kwargs(*accessors, visibility: :private)
      ::Dry::Constructor::Kwargs.new(*accessors, visibility: visibility)
    end
  end
end

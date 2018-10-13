# frozen_string_literal: true

require 'dry-struct'

module SausageSandwich
  class Product < Dry::Struct
    attribute :name, Types::Strict::String
    attribute :proteins, Types::Coercible::Decimal
    attribute :fats, Types::Coercible::Decimal
    attribute :carbohydrates, Types::Coercible::Decimal
    attribute :weight, Types::Strict::Integer.default(100)
  end
end

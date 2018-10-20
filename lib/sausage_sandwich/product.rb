# frozen_string_literal: true

require 'dry-struct'
require 'sausage_sandwich/types'
require 'sausage_sandwich/nutrition_facts'

module SausageSandwich
  class Product < Dry::Struct
    attribute :name, Types::Strict::String
    attribute :nutrition_facts, Types.Constructor(NutritionFacts)
    attribute :weight, Types::Strict::Integer.default(100)
  end
end

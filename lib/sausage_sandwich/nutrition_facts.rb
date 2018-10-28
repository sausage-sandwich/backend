# frozen_string_literal: true

require 'bigdecimal'
require 'bigdecimal/util'
require 'dry-struct'
require 'sausage_sandwich/types'

module SausageSandwich
  class NutritionFacts < Dry::Struct
    PROTEINS_CALORIES = 4.1.to_d
    FATS_CALORIES = 9.29.to_d
    CARBS_CALORIES = 4.1.to_d

    attribute :proteins, Types::Coercible::Decimal
    attribute :fats, Types::Coercible::Decimal
    attribute :carbohydrates, Types::Coercible::Decimal

    def calories
      proteins * PROTEINS_CALORIES + fats * FATS_CALORIES + carbohydrates * CARBS_CALORIES
    end

    def to_s
      "Calories: #{calories.to_f}, proteins: #{proteins.to_f}, fats: #{fats.to_f}, " \
        "carbohydrates: #{carbohydrates.to_f}"
    end
  end
end

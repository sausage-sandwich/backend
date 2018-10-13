# frozen_string_literal: true

module SausageSandwich
  class DailyDiet
    attr_reader :calories, :proteins, :fats, :carbohydrates

    def initialize(calories:, proteins:, fats:, carbohydrates:)
      @calories = calories
      @proteins = proteins
      @fats = fats
      @carbohydrates = carbohydrates
      raise ArgumentError unless valid?
    end

    def calculate(*); end

    private

    def valid?
      satisfy_max_calories_limit? && satisfy_min_calories_limit?
    end

    def satisfy_max_calories_limit?
      calories.max >= nutrition_calories(proteins.min, fats.min, carbohydrates.min)
    end

    def satisfy_min_calories_limit?
      calories.min <= nutrition_calories(proteins.max, fats.max, carbohydrates.max)
    end

    def nutrition_calories(proteins_weight, fats_weight, carbs_weight)
      proteins_weight * PROTEINS_CALORIES +
        fats_weight * FATS_CALORIES +
        carbs_weight * CARBS_CALORIES
    end
  end
end

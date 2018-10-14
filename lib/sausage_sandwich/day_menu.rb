# frozen_string_literal: true

module SausageSandwich
  class DayMenu
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
      calories.max >= NutritionFacts.new(
        proteins: proteins.min,
        fats: fats.min,
        carbohydrates: carbohydrates.min
      ).calories
    end

    def satisfy_min_calories_limit?
      calories.min <= NutritionFacts.new(
        proteins: proteins.max,
        fats: fats.max,
        carbohydrates: carbohydrates.max
      ).calories
    end
  end
end

# frozen_string_literal: true

module SausageSandwich
  class DayMenu
    class CalculationProcess
      attr_reader :calories_left, :products

      def initialize(calories_left:)
        @calories_left = calories_left
        @products = []
      end

      def out_of_calories?
        calories_left <= 0
      end

      def product_fit?(product)
        product.calories <= calories_left
      end

      def add_product(product)
        products << product
        @calories_left -= product.calories

        self
      end
    end

    attr_reader :calories, :calculation_process

    def initialize(calories:)
      @calories = calories
      @calculation_process = CalculationProcess.new(calories_left: calories)
    end

    def calculate(products)
      result = products.each_with_object(calculation_process) do |product, process|
        break if process.out_of_calories?

        process.add_product(product) if process.product_fit?(product)
      end

      result.products
    end
  end
end

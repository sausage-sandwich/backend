# frozen_string_literal: true

require 'sausage_sandwich/product'
require 'sausage_sandwich/day_menu'

RSpec.describe SausageSandwich::DayMenu do
  subject(:day_menu) do
    described_class.new(calories: 400)
  end

  describe '#calculate' do
    subject(:menu) { day_menu.calculate(products) }

    let(:products) do
      [
        chicken,
        buckwheat,
        avocado
      ]
    end
    let(:chicken) { product('Chicken', prot: 22.to_d, fat: 0.5.to_d) }
    let(:buckwheat) { product('Buckwheat', prot: 12.59.to_d, fat: 2.84.to_d, carb: 63.98.to_d) }
    let(:avocado) { product('Avocado', prot: 2, fat: 20, carb: 6) }

    before do
      products.each { |product| puts product.to_s }
    end

    it 'calculates daily diet' do
      expect(menu).to eq [chicken, avocado]
    end
  end

  def product(name, prot: 0, carb: 0, fat: 0)
    SausageSandwich::Product.new(
      name: name,
      nutrition_facts: SausageSandwich::NutritionFacts.new(
        proteins: prot,
        fats: fat,
        carbohydrates: carb
      )
    )
  end
end

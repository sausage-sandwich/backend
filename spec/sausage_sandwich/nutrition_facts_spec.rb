# frozen_string_literal: true

require 'sausage_sandwich/nutrition_facts'

RSpec.describe SausageSandwich::NutritionFacts do
  describe '#calories' do
    let(:proteins) { 2.8.to_d }
    let(:fats) { 3.5.to_d }
    let(:carbohydrates) { 4.7.to_d }

    subject(:calories) do
      described_class.new(
        proteins: proteins,
        fats: fats,
        carbohydrates: carbohydrates
      ).calories
    end

    it { is_expected.to eq(63.265.to_d) }
  end
end

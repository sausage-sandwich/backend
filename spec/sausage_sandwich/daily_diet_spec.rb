require 'sausage_sandwich'
require 'sausage_sandwich/daily_diet'

RSpec.describe SausageSandwich::DailyDiet do
  let(:calories) { 1700..1900 }
  let(:proteins) { 180..220 }
  let(:fats) { 30..50 }
  let(:carbohydrates) { 150..180 }

  subject(:daily_diet) do
    described_class.new(
      calories: calories,
      proteins: proteins,
      fats: fats,
      carbohydrates: carbohydrates
    )
  end

  describe '::new' do
    context 'when valid' do
      specify { is_expected }
    end

    context 'when not valid' do
      let(:calories) { 100..500 }

      it 'raises an ArgumentError' do
        expect { daily_diet }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#calculate' do
    let(:products) do
      [
        SausageSandwich::Product.new(
          name: 'Chicken',
          proteins: 22,
          fats: '0.5'.to_d,
          carbohydrates: 0
        ),
        SausageSandwich::Product.new(
          name: 'Buckwheat',
          proteins: '12.59'.to_d,
          fats: '2.84'.to_d,
          carbohydrates: '63.98'.to_d
        ),
        SausageSandwich::Product.new(
          name: 'Avocado',
          proteins: 2,
          fats: 20,
          carbohydrates: 6
        )
      ]
    end

    subject(:diet) { foo.calculate(products) }

    xit 'calculates daily diet' do
      expect(diet).to eq('Chicken' => 650, 'Buckwheat' => 250, 'Avocado' => 150)
    end
  end
end

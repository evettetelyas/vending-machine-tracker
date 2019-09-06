require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
  end

  describe "relationships" do
    it { should have_many :machine_snacks }
    it { should have_many(:snacks).through(:machine_snacks) }
  end

  describe "avg snack price" do
    it "should calculate avg snack price" do
      evette = Owner.create(name: "Evette")
      mac1 = evette.machines.create(location: "Turing School")
      sn1 = mac1.snacks.create(name: "Twizzlers", price: 12)
      sn2 = mac1.snacks.create(name: "M&M", price: 1.5)
      sn3 = mac1.snacks.create(name: "Candytown", price: 3.5)

      expect(mac1.avg_snack_price.round(2)).to eq(5.67)
    end

    it "should count all unique snacks" do
      evette = Owner.create(name: "Evette")
      mac1 = evette.machines.create(location: "Turing School")
      sn1 = mac1.snacks.create(name: "Twizzlers", price: 12)
      sn2 = mac1.snacks.create(name: "M&M", price: 1.5)
      sn3 = mac1.snacks.create(name: "Candytown", price: 3.5)

      expect(mac1.snack_count).to eq(3)
    end
  end
end

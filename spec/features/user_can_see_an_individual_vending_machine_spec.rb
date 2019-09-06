require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    snack = dons.snacks.create(name: "Twizz", price: 2.5)

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  it "shows all the snacks and prices" do
  
    evette = Owner.create(name: "Evette")
    mac1 = evette.machines.create(location: "Turing School")
    sn1 = mac1.snacks.create(name: "Twizzlers", price: 12.5)
    sn2 = mac1.snacks.create(name: "M&M", price: 1.5)
    sn3 = mac1.snacks.create(name: "Candytown", price: 3.5)

    visit "/machines/#{mac1.id}"

    expect(page).to have_content(sn1.name)
    expect(page).to have_content(sn1.price)
    expect(page).to have_content(sn2.name)
    expect(page).to have_content(sn2.price)
    expect(page).to have_content(sn3.name)
    expect(page).to have_content(sn3.price)
    expect(page).to have_content(mac1.avg_snack_price.round(2))
  end 
end

require 'rails_helper'

RSpec.describe "When a user visits the snack show page", type: :feature do
  scenario "they see snack details" do
    evette = Owner.create(name: "Evette")
    mac1 = evette.machines.create(location: "Turing School")
    mac2 = evette.machines.create(location: "Not Turing School")
    sn1 = Snack.create(name: "Twizzlers", price: 12.5, machines: [mac1, mac2])
    sn2 = mac1.snacks.create(name: "M&M", price: 1.5)
    sn3 = mac1.snacks.create(name: "Candytown", price: 3.5)

    visit "/snacks/#{sn1.id}"

    expect(page).to have_content(sn1.name)
    expect(page).to have_content(sn1.price)
    expect(page).to have_content(mac1.location)
    expect(page).to have_content(mac2.location)
    expect(page).to have_content(mac1.avg_snack_price.round(2))
    expect(page).to have_content(mac2.avg_snack_price.round(2))
    expect(page).to have_content(mac1.snack_count)
    expect(page).to have_content(mac2.snack_count)
  end
end

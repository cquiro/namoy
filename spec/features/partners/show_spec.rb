require 'rails_helper'

describe "Showing a partner" do
  it "requires login" do
    partner = create(:partner)
    visit "/partners/#{partner.id}"
    expect(page).to have_content("Para ver esa página debes iniciar sesión")
  end

end
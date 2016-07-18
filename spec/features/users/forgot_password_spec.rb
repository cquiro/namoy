require 'rails_helper'


RSpec.feature "Reset passwords", type: :feature do
  describe "Forgotten passwords" do
    let!(:user) { create(:user) }

    it "sends a user an email" do
      visit namoy_manejo_contenido_path
      click_link "Olvidé mi contraseña"
      fill_in "Email", with: user.email
      expect {
        click_button "Enviar"
      }.to change{ ActionMailer::Base.deliveries.size }.by(1)

    end
  end

end
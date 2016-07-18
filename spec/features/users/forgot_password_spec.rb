require 'rails_helper'


RSpec.feature "Forgotten passwords", type: :feature do
    let!(:user) { create(:user) }

    it "sends a user an email" do
      visit namoy_manejo_contenido_path
      click_link "Olvidé mi contraseña"
      fill_in "Email", with: user.email
      expect {
        click_button "Enviar"
      }.to change{ ActionMailer::Base.deliveries.size }.by(1)
    end

    # it "resets a password when following the email link" do
    #   visit namoy_manejo_contenido_path
    #   click_link "Olvidé mi contraseña"
    #   fill_in "Email", with: user.email
    #   click_button "Enviar"
    #   open_email(user.email)
    #   expect(page).to have_content("Elige tu nueva contraseña")

    #   fill_in "Nueva Contraseña", with: "mynewpassword1"
    #   fill_in "Nueva Contraseña (otra vez)", with: "mynewpassword1"
    #   click_button "Cambiar mi contraseña"
    #   expect(page).to have_content("La contraseña ha sido restablecida.")
    #   expect(page.current_path).to eq root_path
    # end
end
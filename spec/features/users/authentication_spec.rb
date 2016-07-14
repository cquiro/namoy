require 'rails_helper'

describe "Logging In" do
  it "logs the user in and goes to the products page" do
    User.create(name: "Pepe", email: "pepe@grillo.com", password: "password", password_confirmation: "password")
    visit namoy_manejo_contenido_path
    fill_in "Email", with: "pepe@grillo.com"
    fill_in "Contraseña", with: "password"
    click_button "Iniciar Sesión"

    expect(page).to have_content("Para quienes practican un estilo de vida saludable")
    expect(page).to have_content("Has iniciado sesión en")
  end


  it "displays the email address in the event of a failed login" do
    visit namoy_manejo_contenido_path
    fill_in "Email", with: "pepe@grillo.com"
    fill_in "Contraseña", with: "incorrect"
    click_button "Iniciar Sesión"

    expect(page).to have_content("Por favor revisa tu usuario y contraseña e intenta de nuevo")
    expect(page).to have_field("Email", with: "pepe@grillo.com")
  end
end
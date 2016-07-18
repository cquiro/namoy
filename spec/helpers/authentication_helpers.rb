module AuthenticationHelpers
  module Controller
    def sign_in(user)
      expect(controller).to receive(:current_user).and_return(user)
      expect(controller).to receive(:user_id).and_return(user.id)
    end
  end

  module Feature
    def sign_in(user, options={})
      visit "/namoy_manejo_contenido"
      fill_in "Email", with: user.email
      fill_in "Contraseña", with: options[:password]
      click_button "Iniciar Sesión"
    end
  end
end
module AuthenticationHelpers
  module Controller
    def sign_in(user)
      expect(controller).to receive(:current_user).and_return(user)
      # expect(controller).to receive(:user_id).and_return(user.id)
    end
  end

  module Feature
  end
end
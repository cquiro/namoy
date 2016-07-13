require 'rails_helper'

RSpec.describe UserSessionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    context "with correct credentials" do
      before :each do
        @user = create(:user)
      end

      it "redirects to root path" do
        post :create, email: "pepe@grillo.com", password: "MyString"
        expect(response).to be_redirect
        expect(response).to redirect_to root_path
      end

      it "finds the user" do
        expect(User).to receive(:find_by).with({email: "pepe@grillo.com"}).and_return(@user)
        post :create, email: "pepe@grillo.com", password: "MyString"
      end

      it "authenticates the user" do
        allow(User).to receive(:find_by).and_return(@user)
        expect(@user).to receive(:authenticate)
        post :create, email: "pepe@grillo.com", password: "MyString"
      end

      it "sets the user_id in the session" do
        post :create, email: "pepe@grillo.com", password: "MyString"
        expect(session[:user_id]).to eq(@user.id)
      end

      it "sets the falsh success message" do
        post :create, email: "pepe@grillo.com", password: "MyString"
        expect(flash[:success]).to eq "Has iniciado sesión en el sistema de manejo de contenido de Namoy"
      end
    end

    shared_examples_for "denied login" do
      it "renders the new template" do
        post :create, email: email, password: password
        expect(response).to render_template :new
      end

      it "sets the flash error message" do
        post :create, email: email, password: password
        expect(flash[:error]).to eq("Por favor revisa tu usuario y contraseña e intenta de nuevo")
      end
    end

    context "with blank credentials" do
      let(:email) { "" }
      let(:password) { "" }
      it_behaves_like "denied login"
    end

    context "with incorrect password" do
      before :each do
        @user = create(:user)
      end

      let(:email) { @user.email }
      let(:password) { "incorrect" }
      it_behaves_like "denied login"
    end

    context "with no email in existence" do
      before :each do
        @user = create(:user)
      end

      let(:email) { "none@found.com" }
      let(:password) { "incorrect" }
      it_behaves_like "denied login"
    end
  end
end

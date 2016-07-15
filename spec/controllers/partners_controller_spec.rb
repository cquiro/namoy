require 'rails_helper'

RSpec.describe PartnersController, type: :controller do

  describe "GET #index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    context "logged out" do
      it "requires login" do
        partner = create(:partner)
        get :show, id: partner
        expect(response).to be_redirect
        expect(response).to redirect_to(namoy_manejo_contenido_path)
      end
    end

    context "logged in" do
      before do
        sign_in(build_stubbed(:user))
        # expect(controller).to receive(:current_user).and_return(build_stubbed(:user))
      end

      it "assigns the requested partner to @partner" do
        partner = create(:partner)
        get :show, id: partner
        expect(assigns(:partner)).to eq partner
      end

      it "renders the :show template" do
        partner = create(:partner)
        get :show, id: partner
        expect(response).to render_template :show
      end
    end
  end

  describe "GET #new" do
    it "assigns a new Partner to @partner" do
      get :new
      expect(assigns(:partner)).to be_a_new(Partner)
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "GET #edit" do
    it "assigns the requested partner to @partner" do
      partner = create(:partner)
      get :edit, id: partner
      expect(assigns(:partner)).to eq partner
    end

    it "renders the :edit template" do
      partner = create(:partner)
      get :edit, id: partner
      expect(response).to render_template :edit
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new partner in the database" do
        expect{
          post :create, partner: attributes_for(:partner)
        }.to change(Partner, :count).by(1)
      end

      it "redirects to partners#show" do
        post :create, partner: attributes_for(:partner)
        expect(response).to redirect_to partner_path(assigns[:partner])
      end
    end

    context "with invalid attributes" do
      it "does not save the new partner in the database" do
        expect {
          post :create, partner: attributes_for(:invalid_partner)
        }.not_to change(Partner, :count)
      end

      it "re-renders the :new template" do
        post :create, partner: attributes_for(:invalid_partner)
        expect(response).to render_template :new
      end
    end
  end

  describe "PATCH #update" do
    before :each do
      @partner = create(:partner, 
        name: "Groceries", 
        city: "Bogota" )
    end

    context "with valid attributes" do
      it "locates the requested @partner" do
        patch :update, id: @partner,
        partner: attributes_for(:partner,
            name: "Foods" )
        expect(assigns(:partner)).to eq(@partner)
      end

      it "updates the partner in the database" do
        patch :update, id: @partner,
          partner: attributes_for(:partner,
            name: "Foods",
            city: "Austin" )
          @partner.reload
          expect(@partner.name).to eq("Foods")
          expect(@partner.city).to eq("Austin")
      end

      it "redirects to partners#show" do
        patch :update, id: @partner,
          partner: attributes_for(:partner,
            name: "Foods",
            city: "Austin")
        expect(response).to redirect_to @partner
      end
    end

    context "with invalid attributes" do
      it "does not save the new partner in the database" do
        patch :update, id: @partner,
          partner: attributes_for(:partner,
            name: "Foods",
            city: nil)
        @partner.reload
        expect(@partner.name).to eq("Groceries")
        expect(@partner.city).to eq("Bogota")
      end

      it "re-renders the :edit template" do
        patch :update, id: @partner,
          partner: attributes_for(:partner,
            name: "Foods",
            city: nil )
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do
      @partner = create(:partner)
    end

    it "deletes the partner from the database" do
      expect{
        delete :destroy, id: @partner
      }.to change(Partner, :count).by(-1)
    end

    it "redirects to partners#index" do
      delete :destroy, id: @partner
      expect(response).to redirect_to partners_url
    end
  end

end

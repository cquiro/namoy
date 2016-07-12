require 'rails_helper'

RSpec.describe PartnersController, type: :controller do

  describe "GET #index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
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

  # describe "PATCH #update" do
  #   before :each do
  #     @recipe = create(:natural_recipe, 
  #       name: "Syrup", 
  #       flavor: "orange" )
  #   end

  #   context "with valid attributes" do
  #     it "locates the requested @recipe" do
  #       patch :update, id: @recipe,
  #       recipe: attributes_for(:recipe,
  #           name: "Cake",
  #           flavor: "natural")
  #       expect(assigns(:recipe)).to eq(@recipe)
  #     end

  #     it "updates the recipe in the database" do
  #       patch :update, id: @recipe,
  #         recipe: attributes_for(:recipe,
  #           name: "Cake",
  #           flavor: "natural")
  #         @recipe.reload
  #         expect(@recipe.name).to eq("Cake")
  #         expect(@recipe.flavor).to eq("natural")
  #         expect(@recipe.quantity).to eq("6 things")
  #     end

  #     it "redirects to recipes#show" do
  #       patch :update, id: @recipe,
  #         recipe: attributes_for(:recipe,
  #           name: "Cake",
  #           flavor: "natural")
  #       expect(response).to redirect_to @recipe
  #     end
  #   end

  #   context "with invalid attributes" do
  #     it "does not save the new recipe in the database" do
  #       patch :update, id: @recipe,
  #         recipe: attributes_for(:recipe,
  #           name: "Cake",
  #           flavor: nil)
  #       @recipe.reload
  #       expect(@recipe.name).to eq("Syrup")
  #       expect(@recipe.flavor).to eq("orange")
  #     end

  #     it "re-renders the :edit template" do
  #       patch :update, id: @recipe,
  #         recipe: attributes_for(:recipe,
  #           name: "Cake",
  #           flavor: nil)
  #       expect(response).to render_template :edit
  #     end
  #   end
  # end

  # describe "DELETE #destroy" do
  #   before :each do
  #     @recipe = create(:natural_recipe)
  #   end

  #   it "deletes the recipe from the database" do
  #     expect{
  #       delete :destroy, id: @recipe
  #     }.to change(Recipe, :count).by(-1)
  #   end

  #   it "redirects to recipes#index" do
  #     delete :destroy, id: @recipe
  #     expect(response).to redirect_to recipes_url
  #   end
  # end

end
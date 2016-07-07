require 'rails_helper'

RSpec.describe RecipesController, type: :controller do

  describe "GET #index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested recipe to @recipe" do
      recipe = create(:natural_recipe)
      get :show, id: recipe
      expect(assigns(:recipe)).to eq recipe
    end

    it "renders the :show template" do
      recipe = create(:natural_recipe)
      get :show, id: recipe
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    it "assigns a new Recipe to @recipe" do
      get :new
      expect(assigns(:recipe)).to be_a_new(Recipe)
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "GET #edit" do
    it "assigns the requested recipe to @recipe" do
      recipe = create(:natural_recipe)
      get :edit, id: recipe
      expect(assigns(:recipe)).to eq recipe
    end

    it "renders the :edit template" do
      recipe = create(:natural_recipe)
      get :edit, id: recipe
      expect(response).to render_template :edit
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new recipe in the database" do
        expect{
          post :create, recipe: attributes_for(:natural_recipe)
        }.to change(Recipe, :count).by(1)
      end

      it "redirects to recipes#show" do
        post :create, recipe: attributes_for(:natural_recipe)
        expect(response).to redirect_to recipe_path(assigns[:recipe])
      end
    end

    context "with invalid attributes" do
      it "does not save the new recipe in the database" do
        expect {
          post :create, recipe: attributes_for(:invalid_recipe)
        }.not_to change(Recipe, :count)
      end

      it "re-renders the :new template" do
        post :create, recipe: attributes_for(:invalid_recipe)
        expect(response).to render_template :new
      end
    end
  end

  describe "PATCH #update" do
    before :each do
      @recipe = create(:natural_recipe, 
        name: "Syrup", 
        flavor: "orange" )
    end

    context "with valid attributes" do
      it "locates the requested @recipe" do
        patch :update, id: @recipe,
        recipe: attributes_for(:recipe,
            name: "Cake",
            flavor: "natural")
        expect(assigns(:recipe)).to eq(@recipe)
      end

      it "updates the recipe in the database" do
        patch :update, id: @recipe,
          recipe: attributes_for(:recipe,
            name: "Cake",
            flavor: "natural")
          @recipe.reload
          expect(@recipe.name).to eq("Cake")
          expect(@recipe.flavor).to eq("natural")
          expect(@recipe.quantity).to eq("6 things")
      end

      it "redirects to recipes#show" do
        patch :update, id: @recipe,
          recipe: attributes_for(:recipe,
            name: "Cake",
            flavor: "natural")
        expect(response).to redirect_to @recipe
      end
    end

    context "with invalid attributes" do
      it "does not save the new recipe in the database" do
        patch :update, id: @recipe,
          recipe: attributes_for(:recipe,
            name: "Cake",
            flavor: nil)
        @recipe.reload
        expect(@recipe.name).to eq("Syrup")
        expect(@recipe.flavor).to eq("orange")
      end

      it "re-renders the :edit template" do
        patch :update, id: @recipe,
          recipe: attributes_for(:recipe,
            name: "Cake",
            flavor: nil)
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do
    it "deletes the recipe from the database"
    it "redirects to recipes#index"
  end

end

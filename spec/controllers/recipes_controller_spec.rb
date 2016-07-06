require 'rails_helper'

RSpec.describe RecipesController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "assigns the requested recipe to @recipe"
    it "renders the :show template"
  end

  describe "GET #new" do
    it "assigns a new Recipe to @recipe"
    it "renders the :new template"
  end

  describe "GET #edit" do
    it "assigns the requested recipe to @recipe"
    it "renders the :edit template"
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new recipe in the database"
      it "redirects to recipes#show"
    end

    context "with invalid attributes" do
      it "does not save the new recipe in the database"
      it "re-renders the :new template"
    end
  end

  describe "PATCH #update" do
    context "with valid attributes" do
      it "updates the recipe in the database"
      it "redirects to recipes#show"
    end

    context "with invalid attributes" do
      it "does not save the new recipe in the database"
      it "re-renders the :edit template"
    end
  end

  describe "DELETE #destroy" do
    it "deletes the recipe from the database"
    it "redirects to recipes#index"
  end

end

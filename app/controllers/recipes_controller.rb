class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit]

  def index
    @recipes = Recipe.all
  end

  def show
  end

  def new
    @recipe = Recipe.new
  end

  def edit
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      flash[:success] = "Tu nueva receta ha sido creada"
      redirect_to @recipe
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end

  private
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def recipe_params
      params.require(:recipe).permit(:name, :time_ready, :quantity, :flavor, :ingredients, :instructions, :image)
    end
end

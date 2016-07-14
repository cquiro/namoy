class PartnersController < ApplicationController
  before_action :require_user, only: [:show]
  before_action :set_partner, only: [:show, :edit, :update, :destroy]

  def index
    @partners = Partner.all
  end

  def show

  end

  def new
    @partner = Partner.new
  end

  def edit
  end

  def create
    @partner = Partner.new(partner_params)

    if @partner.save
      flash[:success] = "Un nuevo distribuidor ha sido creado"
      redirect_to @partner
    else
      render :new
    end
  end

  def update
    if @partner.update(partner_params)
      flash[:success] = "El distribuidor ha sido actualizado"
      redirect_to @partner
    else
      render :edit
    end
  end

  def destroy
    @partner.destroy
    redirect_to partners_url, notice: 'El distribuidor ha sido eliminado'
  end

  private

    def set_partner
      @partner = Partner.find(params[:id])
    end

    def partner_params
      params.require(:partner).permit(:name, :country, :city, :logo, :instagram, :facebook, :website)
    end
end

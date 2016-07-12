class PartnersController < ApplicationController
  before_action :set_partner, only: [:show, :edit]

  def index
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

  private

    def set_partner
      @partner = Partner.find(params[:id])
    end

    def partner_params
      params.require(:partner).permit(:name, :country, :city, :logo, :instagram, :facebook, :website)
    end
end

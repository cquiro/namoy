class PartnersController < ApplicationController
  before_action :set_partner, only: [:show]

  def index
  end

  def show
  end

  def new
    @partner = Partner.new
  end

  private

    def set_partner
      @partner = Partner.find(params[:id])
    end

    def partner_params
      params.require(:partner).permit(:name, :country, :city, :logo, :instagram, :facebook, :website)
    end
end

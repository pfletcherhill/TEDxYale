class SponsorshipsController < ApplicationController
  def new
    @sponsorship = Sponsorship.new
    @sponsors = Sponsor.all
    @events = Event.all
  end
  
  def create
    @sponsorship = Sponsorship.new(params[:sponsorship])
    if @sponsorship.save
      redirect_to "/admin/sponsors"
    end
  end
end

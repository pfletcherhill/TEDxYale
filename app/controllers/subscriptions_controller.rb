class SubscriptionsController < ApplicationController
  
  def new
    @subscription = Subscription.new
    
    respond_to do |format|
      format.html
      format.json { render json: @subscription }
    end
  end
  
  def create
    @subscription = Subscription.new(params[:subscription])

    respond_to do |format|
      if (@subscription.save)
      	format.html { redirect_to "/", notice: 'Thank you for registering' }
      else
        render new
      end
    end
  end
end

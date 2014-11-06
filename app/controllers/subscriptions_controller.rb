class SubscriptionsController < ApplicationController
  def create
    respond_to do |format|
      if Subscriber.create(subscriber_params).valid?
        format.js {render json: Hash.new}
      else
        format.js {render nothing: true,status: 400}
      end
    end
  end
  private
  def subscriber_params
    params.require(:subscriber).permit(:email)
  end
end

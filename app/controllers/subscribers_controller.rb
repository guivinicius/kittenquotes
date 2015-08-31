class SubscribersController < ApplicationController

  def index; end

  def create
    subscriber = Subscriber.new(subscribe_params)

    if subscriber.save
      flash[:success] =  t('application.messages.success')
    else
      flash[:danger] =  subscriber.errors.full_messages.first
    end

    redirect_to root_path
  end

  private

  def subscribe_params
    params.permit(:email)
  end

end

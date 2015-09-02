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

  def delete
    subscriber = Subscriber.find_by_email_and_token(params[:email], params[:token])
    if subscriber
      if subscriber.destroy
        flash[:success] =  t('application.messages.success_deleted')
      else
        flash[:danger] =  t('application.messages.error_deleting')
      end
    else
      flash[:danger] =  t('application.messages.not_found')
    end

    redirect_to root_path
  end

  private

  def subscribe_params
    params.permit(:email)
  end

end

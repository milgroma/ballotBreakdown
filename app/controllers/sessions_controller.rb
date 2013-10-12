class SessionsController < Devise::SessionsController

  def create
    params[:voter].merge!(remember_me: 1)
    super
  end

end
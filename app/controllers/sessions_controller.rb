class SessionsController < ApplicationController
  
  include AjaxHelper 
  # def new
  # end

  def create

    p "============="
    p params
    p "============="
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password]) 
      log_in user
      respond_to do |format|
        format.json { render json: {message: "success"} }
      end
    else
      respond_to do |format|
        format.json { render json: {message: "error"} }
 
      end
    end
  end


  def destroy
    log_out
    redirect_to root_path
  end


end

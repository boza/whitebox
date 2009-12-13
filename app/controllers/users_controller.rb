class UsersController < ApplicationController

  skip_before_filter :login_required

  def new
    unless logged_in?
      @user = User.new
    else
      flash[:notice] = t('users.new.already_logged_in', :username => current_user.username)
      redirect_to root_path
    end
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = t('users.create.signed_up')
      redirect_to root_url
    else
      render :new
    end
  end

end

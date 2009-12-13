class SessionsController < ApplicationController
  
  skip_before_filter :login_required, :only => [:new, :create]

  def new
    redirect_to(courses_path) if logged_in?
  end
  
  def create
    user = User.authenticate(params[:login], params[:password])
    if user
      session[:user_id] = user.id
      flash[:notice] = t('sessions.create.logged_in')
      redirect_to_target_or_default(root_url)
    else
      flash.now[:error] = t('sessions.create.invalid_login')
      render :new
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:notice] = t('sessions.destroy.logout')
    redirect_to root_url
  end

end

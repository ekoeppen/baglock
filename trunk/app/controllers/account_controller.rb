class AccountController < ApplicationController
  def index
    redirect_to(:action => 'login')
  end

  def login
    return unless request.post?
    self.current_user = Login.authenticate(params[:login], params[:password])
    if self.current_user
      print "Logged in\n"
      respond_to do |wants|
        wants.html {
          redirect_to :controller => '/item', :action => 'index'
          flash[:notice] = "Logged in successfully"
        }
        wants.js {
          render :update do |page| page << 'window.location.href = window.location.href' end
        }
      end
    else
      print "Not logged in\n"
    end
  end

  def logout
    if self.current_user then self.current_user.forget_me end
    self.current_user = nil
    cookies.delete :auth_token
    reset_session
    respond_to do |wants|
      wants.html {
        flash[:notice] = "You have been logged out."
        redirect_to :controller => '/item', :action => 'index'
      }
      wants.js {
        render :update do |page| page << 'window.location.href = window.location.href' end
      }
    end
  end
  
  def signup
    if request.post?
      @login = Login.new(params[:login]).save!
      redirect_to :action => 'login'
      print "Signup\n"
    end
  end
end
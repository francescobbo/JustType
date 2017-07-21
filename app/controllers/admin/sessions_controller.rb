module Admin
  class SessionsController < AdminController
    skip_before_action :ensure_signin, :ensure_admin, except: :destroy
    before_action :ensure_anonymous, only: [:new, :create]

    def new
    end

    def create
      @user = User.find_by(email: params[:email])

      if @user&.authenticate(params[:password]) && @user.admin?
        session[:user_id] = @user.id
        redirect_to params[:continue] ? params[:continue] : admin_root_path
      else
        flash.now[:error] = "Invalid email or password"
        render :new
      end
    end

    def destroy
      reset_session
      redirect_to root_path
    end

    private

    def ensure_anonymous
      if current_user&.admin?
        redirect_to admin_root_path
      elsif current_user
        redirect_to root_path
      end
    end
  end
end

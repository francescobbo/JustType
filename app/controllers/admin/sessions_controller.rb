module Admin
  class SessionsController < AdminController
    skip_before_action :ensure_signin, :ensure_admin, except: :destroy
    before_action :ensure_anonymous, only: %i[new create]

    def new
    end

    def create
      @user = User.admin.authenticate(params[:email], params[:password])

      if @user
        session[:user_id] = @user.id
        redirect_to after_signin_path
      else
        flash.now[:error] = 'Invalid email or password'
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

    def after_signin_path
      params[:continue] ? params[:continue] : admin_root_path
    end
  end
end

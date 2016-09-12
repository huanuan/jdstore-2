class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :admin_required
    layout "admin"
    def index
      @users = User.all
    end

    def show
      @user = User.find(params[:id])
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy

      redirect_to admin_users_path, alert:'User deleted'
    end

    def admin
      @user = User.find(params[:id])
      @user.admin!
      redirect_to :back
    end

    def user
      @user = User.find(params[:id])
      @user.user!

      redirect_to :back
    end



end

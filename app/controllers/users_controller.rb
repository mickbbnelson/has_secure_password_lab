class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if !@user.save                #&& params[:password] || params[:password_confirmation] != ""
            redirect_to '/users/new'
        else
            session[:user_id] = @user.id
        end
    end

    private

    def user_params 
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
end

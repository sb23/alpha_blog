class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update]
    def show
    end
    
    def new
        @user = User.new
    end

    def edit
    end

    def update
        if(@user.update(user_params))
            flash[:notice] = "User #{@user.username} updated successfully!!"
            redirect_to articles_path
        else
            flash[:alert] = "User #{@user.username} was not updated!"
            render 'edit'
        end
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "Welcome to alpha blog #{@user.username}"
            redirect_to articles_path
        else
            flash[:alert] = "User was not created!"
            render 'new'
        end
    end

    private

    def set_user
        @user = User.find(params.require(:id))
    end

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end

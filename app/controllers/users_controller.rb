class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def show
        @user = User.find(params[:id])
    end

    def create
        #@user = User.new(username: params[:username], email: params[:email], password: params[:password])
        @user = User.new(whitelisted_post_params)
        if @user.save
            redirect_to root_path
        else
            render :new
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        flash.notice = "Article '#{@user.username}' Deleted."

        redirect_to root_path
    end

    def update
        @user = User.find(params[:id])
        if @user.update(whitelisted_post_params)
            redirect_to edit_user_path
        else
            render :edit
        end
    end


  private

  def set_user
    @user = User.find(params[:id])
  end

  def whitelisted_post_params
      params.require(:user).permit(:username,:password)
  end

end

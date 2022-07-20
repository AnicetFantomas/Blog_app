class UserController < ApplicationController
    def show
        @user_id = Post.find(params[:id])
    end
end
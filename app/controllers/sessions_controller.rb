class SessionsController < ApplicationController

    def new
    end

    def create
        @user = User.find_by(email: params[:session][:email].downcase)
        if @user && @user.authenticate(params[:session][:password])
            log_in @user
            @current_user = @user
            

            flash[:success] = "#{@current_user.name} signed in successfully"
            redirect_to root_path
        else
            flash[:danger] = "Incorrect email or password"
            render 'new'
        end

    end

    def delete
        log_out if logged_in?
        flash[:success] = "Successfully logged out"
        redirect_to root_path
    end
end

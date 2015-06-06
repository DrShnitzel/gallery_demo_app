class UsersController < ApplicationController
  before_filter :auth, except: [:create, :login]

  def create
    @user = User.registration(params[:email], params[:passwd])
  end

  def login
    @user = User.find_by(email: params[:email])
    result = @user.check_auth(params[:passwd])
    fail UserExceptions::WrongPassword unless result
  end

  def logout
    @user.change_token
  end

  def update_passwd
    result = @user.check_auth(params[:old_passwd])
    fail UserExceptions::WrongPassword unless result
    @user.update_password(params[:passwd])
  end

  def destroy
    @user.destroy
  end
end

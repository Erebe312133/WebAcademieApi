class UserController < ApplicationController
  before_action :find_user, only: [:show, :update, :destroy]

  def index
    @users = User.all
    if @users.blank?
      render json: "Users not found", status: 404
    else
      render json: @users, status: 200
    end
  end

  def create
    @user = User.new(params_required)
    if @user.save
      render json: "successful operation", status: 202
    else
      render json: "User already exist", status: 401
    end
  end

  def show
    render json: @user, status: 200
  end

  def update
    if @user.update(params_required)
      render json: "User updated", status: 200
    else
      render json: "Invalid data supplied", status: 400
    end
  end

  def destroy
    @user.destroy
    render json: "User deleted", status: 200
  end

  private
  def find_user
    @user = User.find_by_id(params[:id])
    if @user.blank?
      render json: "User not found", status: 404
    end
  end

  def params_required
    params.tap { |p| p[:firstname] = p[:firstName] }
    params.tap { |p| p[:lastname] = p[:lastName] }
    params.tap { |p| p[:salary_claims] = p[:salaryClaims] }
    params.permit(:firstname, :lastname, :salary_claims, :description, :email)
  end

end

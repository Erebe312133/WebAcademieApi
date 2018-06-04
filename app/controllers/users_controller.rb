class UsersController < ApplicationController
  before_action :find_user, only: [:show, :update, :destroy, :skill_list]

  def index
    @users = User.all
    if @users.blank?
      render json: "Users not found", status: 404
    else
      render "users/index", status: 200
    end
  end

  def create
    return if already_exist
    @user = User.new(params_required)
    if @user.save
      render json: "successful operation", status: 200
    else
      render json: "Invalid data", status: 401
    end
  end

  def show
    render "users/show", status: 200
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

  def skill_list
    @skills = @user.skills.all
    render "skills/index", status: 200
  end

  def index_by_skill
    @users = User.with_skill_type(params[:type])
    render "users/index", status: 200
  end

  def index_by_skill_and_note
    unless params[:note] =~ /\A[0-5]\z/
      render 'Invalid parameters supplied', 400
    else
      @users = User.with_skill_type_and_note(params[:type], params[:note])
      render "users/index", status: 200
    end
  end

  private
  def find_user
    @user = User.find_by_id(params[:id])
    if @user.blank?
      render json: "User not found", status: 404
    end
  end

  def already_exist
    unless User.find_by_email(params[:email]).blank?
      render json: "User already exist", status: 401
      return true
    end
    return false
  end

  def params_required
    params.tap { |p| p[:firstname] = p[:firstName] }
    params.tap { |p| p[:lastname] = p[:lastName] }
    params.tap { |p| p[:salary_claims] = p[:salaryClaims] }
    params.permit(:firstname, :lastname, :salary_claims, :description, :email)
  end

end

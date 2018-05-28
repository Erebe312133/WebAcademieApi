class SkillsController < ApplicationController
  before_action :find_skill, only: [:show, :update, :destroy]

  def create
    @skill = Skill.new(params_required)
    @skill.user = User.find_by_id(params[:userId]) if params.has_key? :userId
    if @skill.save
      render json: "successful operation", status: 202
    else
      render json: "Invalid input", status: 401
    end
  end

  def show
    render "skill/show", status: 200
  end

  def update
    @skill.user = User.find_by_id(params[:userId]) if params.has_key? :userId
    if @skill.update(params_required)
      render json: "Skill updated", status: 200
    else
      render json: "Invalid data supplied", status: 400
    end
  end

  def destroy
    @skill.destroy
    render json: "Skill deleted", status: 200
  end

  private
  def find_skill
    @skill = Skill.find_by_id(params[:id])
    if @skill.blank?
      render json: "Skill not found", status: 404
    end
  end

  def params_required
    params.tap { |p| p[:mtype] = p[:type] }
    params.permit(:note, :name, :mtype)
  end

end

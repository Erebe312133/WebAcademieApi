class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :update, :destroy]

  def index
    @projects = Project.all
    if @projects.blank?
      render json: "projects not found", status: 404
    else
      render "project/index", status: 200
    end
  end

  def create
    @project = Project.new(params_required)
    @project.user = User.find_by_id(params[:userId]) if params.has_key? :userId
    setup_links if params.has_key? :links
    setup_languages if params.has_key? :languages
    if @project.save
      render json: "successful operation", status: 202
    else
      render json: "Invalid input", status: 401
    end
  end

  def show
    render "project/show", status: 200
  end

  def update
    @project.user = User.find_by_id(params[:userId]) if params.has_key? :userId
    setup_links if params.has_key? :links
    setup_languages if params.has_key? :languages
    if @project.update(params_required)
      render json: "project updated", status: 200
    else
      render json: "Invalid data supplied", status: 400
    end
  end

  def destroy
    @project.destroy
    render json: "project deleted", status: 200
  end

  private
  def find_project
    @project = Project.find_by_id(params[:id])
    if @project.blank?
      render json: "project not found", status: 404
    end
  end

  def setup_links
    params[:links].each_pair {|key, value| @project.links << Link.new(key: key, value:value)}
  end

  def setup_languages
    params[:languages].each_pair {|key, value| @project.languages << Language.new(key: key, value:value)}
  end

  def params_required
    params.require(:project).permit(:name, :descriptive)
  end
end

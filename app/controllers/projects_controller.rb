class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :update, :destroy]

  def index
    @projects = Project.all
    if @projects.blank?
      render json: "Projects not found", status: 404
    else
      render "projects/index", status: 200
    end
  end

  def create
    @project = Project.new(params_required)
    @project.user = User.find_by_id(params[:userId]) if params.has_key? :userId
    setup_links if params.has_key? :links
    setup_languages if params.has_key? :languages
    if @project.save
      render json: "Project added", status: 200
    else
      render json: "Invalid input", status: 405
    end
  end

  def show
    render "projects/show", status: 200
  end

  def update
    @project.user = User.find_by_id(params[:userId]) if params.has_key? :userId
    setup_links if params.has_key? :links
    setup_languages if params.has_key? :languages
    if @project.update(params_required)
      render json: "Project updated", status: 200
    else
      render json: "Invalid input", status: 405
    end
  end

  def destroy
    @project.destroy
    render json: "Project deleted", status: 200
  end

  private
  def find_project
    @project = Project.find_by_id(params[:id])
    if @project.blank?
      render json: "Project not found", status: 404
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

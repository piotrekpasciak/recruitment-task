class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_developer, only: [:new, :create]

  def index
    @projects = Project.all.includes(:developer)
  end

  def new
    @project = @developer.projects.build
  end

  def create
    @project = @developer.projects.build(project_params)

    if @project.save
      flash[:success] = 'Project saved'
      redirect_to projects_path
    else
      flash[:error] = 'Project could not be saved'
      render :new
    end
  end

  private

  def set_developer
    @developer = Developer.find(params[:developer_id])
  end

  def project_params
    params.require(:project).permit(:name, :description)
  end
end

class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_developer, only: [:new, :create]

  def index
    @projects = Project.count_and_average_votes.includes(:developer, :languages)
  end

  def new
    @project = @developer.projects.build
  end

  def create
    @project = @developer.projects.build(project_params)

    if @project.save
      flash[:success] = 'Project saved.'
      redirect_to developer_path(@developer)
    else
      flash[:error] = 'Project could not be saved.'
      render :new
    end
  end

  private

  def set_developer
    @developer = Developer.find(params[:developer_id])
  end

  def project_params
    params.require(:project).permit(:name, :description, language_ids: [])
  end
end

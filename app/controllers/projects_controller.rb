class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_developer, only: [:new, :create]

  def index
    @projects = Project.select('projects.*, COUNT(distinct votes.id) AS votes_count, AVG(votes.value) AS votes_avg')
                       .joins('LEFT JOIN votes ON projects.id = votes.project_id')
                       .group('projects.id').includes(:developer)
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

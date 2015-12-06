class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def index
    @projects = Project.all
  end

  def new
    @project = developer.projects.build
  end

  def create
    @project = developer.projects.build(developer_params)
  end

  private

  def developer
    @developer ||= Developer.find(params[:developer_id])
  end

  def project_params
    params.require(:project).permit(:name, :description)
  end
end

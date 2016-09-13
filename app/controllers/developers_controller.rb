class DevelopersController < ApplicationController
  before_action :authenticate_user!

  def show
    @developer = Developer.find(params[:id])

    @projects = if params[:language].nil?
                  @developer.projects.includes(:languages).order('projects.created_at DESC')
                                                          .paginate(page: params[:page] , per_page: 5)
                else
                  @developer.projects.includes(:languages).where(languages: { name: params[:language] })
                                                          .order('projects.created_at DESC')
                                                          .paginate(page: params[:page] , per_page: 5)
                end
  end

  def index
    @developers = Developer.all
  end

  def new
    @developer = Developer.new
  end

  def create
    @developer = Developer.new(developer_params)

    if @developer.save
      flash[:success] = 'Developer saved.'
      redirect_to developers_path
    else
      flash[:error] = 'Developer could not be saved.'
      render :new
    end
  end

  private

  def developer_params
    params.require(:developer).permit(:first_name, :last_name, :avatar)
  end
end

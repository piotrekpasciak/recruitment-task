class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:create]
  before_action :set_vote, only: [:destroy]

  def create
    vote = Vote.new(vote_params)

    if vote.save
      flash[:success] = 'You have successfully added your vote.'
    else
      flash[:error] = "Vote couldn't be saved."
    end
    redirect_to projects_path
  end

  def destroy
    @vote.destroy
    flash[:success] = 'You have successfully deleted your vote.'
    redirect_to projects_path
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_vote
    @vote = Vote.find(params[:id])
  end

  def vote_params
    params.require(:vote).permit(:value).merge(user: current_user, project: @project)
  end
end

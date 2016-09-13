class LanguagesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize!
  before_action :set_language, only: [:destroy]

  def index
    @languages = Language.all
  end

  def destroy
    @language.destroy
    flash[:success] = 'You have successfully deleted language.'

    redirect_to languages_path
  end

  private

  def set_language
    @language = Language.find(params[:id])
  end
end

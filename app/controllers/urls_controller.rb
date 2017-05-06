class UrlsController < ApplicationController
  def new
    @url = Url.new
  end

  def create
    @url = Url.new(strong_params)
    if @url.save
      redirect_to "/urls"
    else
      flash[:notice] = @url.errors.messages
      redirect_to "/urls/new"
    end
  end

  private
  def strong_params
    params.require(:url).permit(:long_url)
  end
end

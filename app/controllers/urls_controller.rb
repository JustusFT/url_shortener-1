class UrlsController < ApplicationController
  def new
    @url = Url.new
  end

  def create
    @url = Url.new(strong_params)
    if @url.save
      redirect_to "/urls"
    else
      @errors = @url.errors.messages
      render "new"
    end
  end

  def index
    @urls = Url.all
  end

  def show
    @url = Url.find(params[:id])
  end

  private
  def strong_params
    params.require(:url).permit(:long_url)
  end
end

class UrlsController < ApplicationController
  def index
    @urls = Url.all
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
    @url.shorten
    # if @url.save
    #   redirect_to @url
    # else
    #   render 'new'
    # end
    if @url.save
      respond_to do  |format|
        format.html {redirect_to urls_path}
        format.js
      end
    else
      @errors = @url.errors.full_messages
      render 'new'
    end
  end

  def show
    @url = Url.find(params[:id])
  end

  private

  def url_params
    params.require(:url).permit(:long_url)
  end
end

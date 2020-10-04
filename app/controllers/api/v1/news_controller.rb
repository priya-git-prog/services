class Api::V1::NewsController < Api::V1::BaseController

  def index
    news = News.all
    render json: news
  end
end
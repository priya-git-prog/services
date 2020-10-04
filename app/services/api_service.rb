class ApiService


  def get_news
    url = "https://newsapi.org/v2/top-headlines?sources=google-news&apiKey=0a708bae59cd4f92b26a6bc4c114f1f0"
    response = fetch_new_article_data(url)
    store_article_details(response)
  end

  def store_news_article_details(response)
    news = News.new()
    news.status = response["status"]
    news.totalResults = response["totalResults"]
    news.articles = response["articles"]
    news.save!
  end

  def fetch_news_article_data(url)
    response = RestClient.get(url)
    JSON.parse(response.body)
  rescue => exception
    ExceptionNotifier.notify_exception(exception)
    {}
  end

end
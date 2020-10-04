namespace :api_service_scheduler do
  desc "Populate Articles data"
  task fetch_news: :environment do    
    begin    
      ApiService.new().get_news
    rescue Exception => e
      ExceptionNotifier.notify_exception(e)
    end
  end
end

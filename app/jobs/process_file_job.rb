class ProcessFileJob < ApplicationJob
  queue_as :default

  def perform(file_uploader)
    FileUploaderService.new(file_uploader).import
  end
end

require 'csv'
class FileUploaderService
  attr_reader :file_uploader

  def initialize(file_uploader)
    @file_uploader = file_uploader
  end

  def import
    Rails.logger.info("---------------- processing file----------")
    CSV.parse(@file_uploader.file.download, headers: true) do |row|
      data = row.to_hash.with_indifferent_access.each{|k,v| v.strip! if v.is_a?(String)}
      Rails.logger.info("---------------- processing #{data}----------")
      store_product_data(data)
    end
  rescue CSV::MalformedCSVError => e
    ExceptionNotifier.notify_exception(e)
    Rails.logger.info("---------- import failed: invalid CSV --------")
  end

  def store_product_data(data)
    product = Product.new()
    product.product_name = data["name"]
    product.material_code = data["material_code"]
    product.product_category_code = data["product_category_code"]
    product.status = data["status"]
    product.save!
  end

end
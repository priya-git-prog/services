class FileUploader < ApplicationRecord
  has_one_attached :file 

  validates_presence_of :file
end

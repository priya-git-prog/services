class Api::V1::FileUploaderController < Api::V1::ApplicationController

  skip_before_action :verify_authenticity_token

  def create
    file_uploader = FileUploader.new(uploader_params)
    if file_uploader.save
      ProcessFileJob.perform_later(file_uploader)
      respond_to do |format|
        msg = { title: "Success", message: "The file has been received for processing." }
        format.json  { render json: msg, status: 200 }
      end
    else
      respond_to do |format|
        msg = { title: "Failure", message: "The file upload failed." }
        format.json  { render json: msg, status: 422 }
      end
    end
  end

  private

  def uploader_params
    params.require(:file_uploader).permit(:file)
  end
end

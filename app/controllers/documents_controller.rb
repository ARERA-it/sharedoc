class DocumentsController < ApplicationController
  before_action :set_document

  def checkin
    @document.sharepoint_file.checkin
    redirect_to @document.specific_objective
  end

  def checkout
    @document.sharepoint_file.checkout
    redirect_to @document.specific_objective
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = Document.find_by(unique_id: params[:id])
    end
end

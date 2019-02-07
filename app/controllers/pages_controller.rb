class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  # GET /pages
  # GET /pages.json
  def index
    site = Sharepoint::Site.new ENV["host"], ENV["base_path"]
    site.session.authenticate ENV["username"], ENV["password"]
    folder  = site.folder ENV["base_folder"]
    # folder.add_folder("natale")
    @files  = folder.files

    # Attributes of file:
    # :author, :checked_out_by_user, :effective_information_rights_management_settings,
    #  :information_rights_management_settings, :list_item_all_fields, :locked_by_user,
    #  :modified_by, :properties, :version_events, :versions, :check_in_comment,
    #  :check_out_type, :content_tag, :customized_page_status, :e_tag, :exists,
    #  :irm_enabled, :length, :level, :linking_uri, :linking_url, :major_version,
    # :minor_version, :name, :server_relative_url, :time_created, :time_last_modified,
    # :title, :ui_version, :ui_version_label, :unique_id

  end

  # GET /pages/1
  # GET /pages/1.json
  def show
  end

  # GET /pages/new
  def new
    @page = Page.new
  end

  # GET /pages/1/edit
  def edit
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = Page.new(page_params)

    respond_to do |format|
      if @page.save
        format.html { redirect_to @page, notice: 'Page was successfully created.' }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to @page, notice: 'Page was successfully updated.' }
        format.json { render :show, status: :ok, location: @page }
      else
        format.html { render :edit }
        format.json { render json: @page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to pages_url, notice: 'Page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.fetch(:page, {})
    end
end

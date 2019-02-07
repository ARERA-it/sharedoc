class SharepointSite
  attr_reader :site

  def initialize
    @site = Sharepoint::Site.new ENV["host"], ENV["base_path"]
    @site.session.authenticate ENV["username"], ENV["password"]
  end


  def folder(*args)
    subpath = File.join(ENV["base_folder"], args.to_a)
    site.folder subpath
  end
end

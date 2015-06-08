class MediaDataController < ApplicationController
  before_filter :auth, except: [:index]

  def index
    limit = params[:limit] || 20
    # offsetless pagination is preferable
    # see http://use-the-index-luke.com/no-offset for details
    @media_data = MediaDatum.
      where(user_id: params[:user_id].to_i).
      where("id > ?", params[:last_seen_id].to_i).
      limit(limit.to_i)
  end

  def create
    @media_datum = @user.media_data.create(
      url: params[:url],
      file: params[:file])
  end

end

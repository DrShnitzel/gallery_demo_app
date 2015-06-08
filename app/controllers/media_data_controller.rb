class MediaDataController < ApplicationController
  before_filter :auth, except: [:index]

  def index
    limit = params[:limit] || 20
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

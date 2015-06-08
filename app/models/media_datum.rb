class MediaDatum < ActiveRecord::Base
  mount_uploader :file, MediaUploader
  belongs_to :user

  validates :url,
            format: {
              with: /[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&\/\/=]*)/i,
              message: 'is not valid url' },
            strict: true

  validates :file, presence: true, strict: true
  validates :user_id, presence: true, strict: true

end

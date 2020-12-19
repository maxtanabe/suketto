class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :thanks
  has_one_attached :video
  has_one :post_order
  with_options presence: true do
    validates :title
    validates :price, format: { with: /\A[-]?[0-9]+(\.[0-9]+)?\z/}
    validates_inclusion_of :price, in: 500..5000
    # validates :video
  end
  validate :video_type
  validate :video_size

  private

  def video_type
    if !video.blob.content_type.in?(%('video/quicktime video/quicktime'))
        errors.add(:video, '動画は携帯で撮影したmov形式でアップロードしてください')
    end
  end

  def video_size
    if video.blob.byte_size > 20.megabytes
      errors.add(:video, "動画を短く撮影し直してください(20MB以内)")
    end
  end

end
class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group

  mount_uploader :image, ImageUploader

  validates :body_or_image, presence: true

  def self.set_json_values(message)
    {
      nickname: message.user.nickname,
      created_at: message.created_at.to_s(:created_at),
      body: message.body,
      image: message.image.url
    }
  end

  private
    def body_or_image
      body.presence or image.presence
    end
end

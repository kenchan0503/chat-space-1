class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group

  mount_uploader :image, ImageUploader

  validates :body, presence: true,
    if: :image, presence: false

  def self.set_json_values(message)
    {
      nickname: message.user.nickname,
      created_at: message.created_at.to_s(:created_at),
      body: message.body,
      image: message.image.url
    }
  end
end

class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :body, presence: true

  def self.set_json_values(message)
    {
      nickname: message.user.nickname,
      created_at: message.created_at.to_s(:created_at),
      body: message.body
    }
  end
end

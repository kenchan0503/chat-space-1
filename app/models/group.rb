class Group < ApplicationRecord
  has_many :messages
  has_many :users_groups
  has_many :users, through: :users_groups
  accepts_nested_attributes_for :users_groups

  validate :blank_error_messages
  def blank_error_messages
    if name.blank? #グループ名が空欄だった場合
      errors[:base] << "グループ名は必ず入力して下さい"
    end
    if user_ids.blank? #チャットメンバーが一人も選ばれていなかった場合
      errors[:base] << "チャットメンバーは必ず選択して下さい"
    end
  end
end
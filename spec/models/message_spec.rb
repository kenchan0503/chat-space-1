require 'rails_helper'

describe Message do
  describe '#create' do
    it "is valid with a body, image" do
      message = build(:message)
      expect(message).to be_valid
    end

    it "is valid with a body, even if without a image" do
      message = build(:message, image: "")
      expect(message).to be_valid
    end

    it "is invalid without body" do
      message = build(:message, body: "")
      message.valid?
      expect(message.errors[:body]).to include("を入力してください")
    end
  end
end

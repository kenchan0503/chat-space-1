require 'rails_helper'

describe MessagesController do

    let(:group) { create(:group) }
    let(:user)   { create(:user) }
    let!(:message) { build(:message, group_id: group.id) }
    let!(:message_params) { { body: message.body, group_id: message.group_id, user_id: message.user_id } }

    before do
      login_user user
    end

    describe 'GET/POST #set_view_instance_variables' do

      it "assigns the requested contact to @group" do
        get :index, params: { group_id: group }
        expect(assigns(:group)).to eq group
      end

      it "assigns the requested contact to @users" do
        get :index, params: { group_id: group }
        users = group.users
        expect(assigns(:users)).to eq users
      end

      it "assigns the requested contact to @messages" do
        get :index, params: { group_id: group }
        messages = group.messages
        expect(assigns(:messages)).to eq messages
      end


    end

  describe "GET #index" do

    it "assigns the requested contact to @message" do
      get :index, params: { group_id: group }
      expect(assigns(:message)).to be_a_new(Message)
    end

    it "renders the index template" do
      get :index, params: { group_id: group }
      expect(response).to render_template :index
    end

  end

  describe 'POST #create' do

    context "when @message is properly saved" do

      it "saves a new message" do
        expect{
          post :create, params: { group_id: group, message: message_params }
        }.to change(Message, :count).by(1)
      end

      it "render the index template" do
        post :create, params: { group_id: group, message: message_params }
        expect(response).to render_template :index
      end

    end

    context "when @message is not saved" do

      it "cannot save a new message" do
        expect {
          post :create, params: {group_id: group, message: attributes_for(:message, body: "") }
        }.to change(Message, :count).by(0)
      end

      it "render the index tamplate" do
        post :create, params: { group_id: group, message: attributes_for(:message, body: "") }
        expect(response).to render_template :index
      end

      it "includes flash[:alert]" do
        post :create, params: { group_id: group, message: attributes_for(:message, body: "") }
        expect(flash[:alert]).to include("何かメッセージを入力してください")
      end

    end
  end

end

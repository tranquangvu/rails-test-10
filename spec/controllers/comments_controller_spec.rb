require 'rails_helper'

describe CommentsController do  
  describe '#new' do
    def do_request
      xhr :get, :new, parent_id: comment.id, format: :js
    end

    let!(:user)   { create(:user) }
    let(:comment) { create(:comment) }

    before do
      sign_in user
    end

    it 'assigns a new comment' do
      do_request
      expect(assigns(:comment).parent_id).to eq comment.id
    end
  end

  describe '#create' do
    def do_request
      post :create, comment: attributes_for(:comment), format: :js
    end

    let!(:user)   { create(:user) }

    before do
      sign_in user
    end

    it 'creates a comment' do
      expect{ do_request }.to change{ Comment.count }.from(0).to(1)
    end
  end
end

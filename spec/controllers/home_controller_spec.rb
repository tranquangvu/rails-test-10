require 'rails_helper'

describe HomeController do
  describe '#index' do
    def do_request
      get :index
    end

    let!(:user)           { create(:user) }
    let!(:ben_comment)    { create(:comment) }
    let!(:benfwz_comment) { create(:comment) }
    let!(:replies)        { create_list(:comment, 2, parent: ben_comment) }

    before do
      sign_in user
    end

    it 'assigns comments and return :index views' do
      do_request
      expect(assigns(:comments)).to eq [ben_comment, benfwz_comment]
      expect(response).to render_template :index
    end
  end
end

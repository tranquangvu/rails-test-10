require 'rails_helper'

describe Comment do
  context 'validations' do
    it { is_expected.to validate_presence_of :content }
  end

  context 'assocations' do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :parent }
    it { is_expected.to have_many :replies }
  end

  describe '.roots' do
    let!(:ben_comment)    { create(:comment) }
    let!(:benfwz_comment) { create(:comment) }
    let!(:replies)       { create_list(:comment, 2, parent: ben_comment) }

    it 'returns only parent comment' do
      expect(Comment.roots).to eq [ben_comment, benfwz_comment]
    end
  end
end

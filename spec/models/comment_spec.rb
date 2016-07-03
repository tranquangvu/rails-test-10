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
    let!(:parent) { create(:comment) }
    let!(:children) { create_list(:comment, 2, parent: parent) }

    it 'returns only parent comment' do
      expect(Comment.roots).to include parent
    end
  end
end

FactoryGirl.define do
  factory :comment do
    content "Comment content"
    user nil
    parent nil
  end
end

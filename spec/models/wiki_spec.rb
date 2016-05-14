require 'rails_helper'

RSpec.describe Wiki, type: :model do
  let(:user) {FactoryGirl.create(:user)}
  let(:wiki) {FactoryGirl.create(:wiki, user: user)}
  
  it {is_expected.to belong_to(:user)}

  it {is_expected.to validate_presence_of(:title)}
  it {is_expected.to validate_presence_of(:body)}
  it {is_expected.to validate_presence_of(:user)}

  describe "attributes" do
    it "has title and body attributes" do
      expect(wiki).to have_attributes(title: wiki.title, body: wiki.body)
    end
  end

end

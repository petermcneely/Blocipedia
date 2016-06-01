require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {FactoryGirl.create(:user)}
  it {is_expected.to have_many(:wikis)}

  it {is_expected.to validate_presence_of(:email)}
  it {is_expected.to validate_presence_of(:password)}
  it {is_expected.to validate_presence_of(:role)}

  describe "user attributes" do
    it "expects user to have a standard role by default" do
      expect(user.role).to eq "standard"
    end
  end
end

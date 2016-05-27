require 'rails_helper'

RSpec.describe WikiPolicy do
  subject {WikiPolicy.new(user, wiki)}

  context "a visitor" do
    let(:user) {nil}
    let(:wiki) {FactoryGirl.build(:wiki)}

    it {should_not pundit_permit(:update)}
  end

  context "a user" do
    let(:user) {FactoryGirl.create(:user)}
    let(:wiki) {FactoryGirl.create(:wiki, user: user)}

    it {should pundit_permit(:update)}
  end
end

require 'rails_helper'

RSpec.describe ChargesController, type: :controller do
  describe "GET downgrade" do
    login_user
    before do
      subject.current_user.premium!
    end

    it "sets a user's role to standard" do
      get :downgrade
      expect(subject.current_user.role).to eq "standard"
    end

    it "redirects to user edit registration page" do
      get :downgrade
      expect(response).to redirect_to(edit_user_registration_path(subject.current_user))
    end
  end
end

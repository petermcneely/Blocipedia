module ControllerMacros
  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:user, email: "user@blocipedia.com", password: "helloworld")
      user.confirm
      sign_in user
    end
  end

  def setup_collaborator
    login_user
    before do
      subject.current_user.premium!
      @user = FactoryGirl.create(:user) #let(@user) {FactoryGirl.create(:user)}
      @wiki = FactoryGirl.create(:wiki, user: subject.current_user) #let(@wiki) {FactoryGirl.create(:wiki, user: subject.current_user)}
      @collaborator = FactoryGirl.create(:collaborator, user_id: @user.id, wiki_id: @wiki.id)#let!(@collaborator) {FactoryGirl.create(:collaborator, user_id: @user.id, wiki_id: @wiki.id)}
    end
  end
end

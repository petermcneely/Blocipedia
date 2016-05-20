require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  context 'logged in user' do
    login_user

    describe "GET index" do
      it "renders the index template" do
        get :index
        expect(response).to render_template("index")
      end
    end

    describe "GET about" do
      it "renders the about page" do
        get :about
        expect(response).to render_template("about")
      end
    end
  end

  context 'non-logged in user' do
    describe "GET index" do
      it "renders the index template" do
        get :index
        expect(response).to render_template("index")
      end
    end

    describe "GET about" do
      it "redirects user to log in" do
        get :about
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end

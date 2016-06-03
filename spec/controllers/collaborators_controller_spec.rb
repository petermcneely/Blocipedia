require 'rails_helper'

RSpec.describe CollaboratorsController, type: :controller do
  
  describe "POST #create" do
    setup_collaborator
    it "returns http success" do
      post :create, collaborator: { user_id: @user.id, wiki_id: @wiki.id }
      expect(response).to have_http_status(:redirect)
    end

    it "increases the number of collaborators by one" do
      expect{post :create, collaborator: { user_id: @user.id, wiki_id: @wiki.id }}.to change(Collaborator, :count).by 1
    end

    it "redirects to the wiki page" do
      post :create, collaborator: { user_id: @user.id, wiki_id: @wiki.id }
      expect(response).to redirect_to edit_wiki_path(@wiki)
    end
  end

  describe "DELETE #destroy" do
    setup_collaborator
    it "returns http success" do
      delete :destroy, id: @collaborator.id
      expect(response).to have_http_status(:redirect)
    end

    it "decreases the number of collaborators by one" do
      count = Collaborator.count
      delete :destroy, id: @collaborator.id
      expect(Collaborator.count).to eq count - 1
    end

    it "redirects to the wiki page" do
      delete :destroy, id: @collaborator.id
      expect(response).to redirect_to edit_wiki_path(@wiki)
    end
  end

end

class CollaboratorsController < ApplicationController
  before_action :authenticate_user!

  def create
    @collaborator = Collaborator.new(collaborator_params)

    if @collaborator.save
      flash[:notice] = "Collaborator saved successfully."
    else
      flash[:alert] = "Unable to create collaborator. Please try again."
    end

    respond_to do |format|
      format.html #{ redirect_to edit_wiki_path(@collaborator.wiki_id) }
      format.js
    end
  end

  def destroy
    @collaborator = get_collaborator

    if @collaborator.destroy
      flash[:notice] = "Collaborator deleted successfully."
    else
      flash[:alert] = "Unable to delete collaborator. Please try again."
    end

    respond_to do |format|
      format.html #{ redirect_to edit_wiki_path(@collaborator.wiki_id) }
      format.js
    end
  end

  private
  def collaborator_params
    params.require(:collaborator).permit(:wiki_id, :user_id)
  end

  def get_collaborator
    begin
      Collaborator.find(params[:id])
    rescue
      flash[:alert] = "Unable to find that collaborator."
      redirect_to root_path
    end
  end
end

class WikisController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def index
    @wikis = Wiki.visible_to(current_user)
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = Wiki.new(wiki_params)
    @wiki.user = current_user

    if @wiki.save
      flash[:notice] = "Wiki saved successfully."
      redirect_to @wiki
    else
      flash[:alert] = "Unable to create wiki. Please try again."
      render :new
    end
  end

  def show
    @wiki = get_wiki
  end

  def edit
    @wiki = get_wiki
  end

  def update
    @wiki = get_wiki
    @wiki.assign_attributes(wiki_params)

    authorize @wiki
    if @wiki.save
      flash[:notice] = "Wiki updated successfully."
      redirect_to @wiki
    else
      flash[:alert] = "Unable to update wiki. Please try again."
      render :edit
    end
  end

  def destroy
    @wiki = get_wiki

    if @wiki.destroy
      flash[:notice] = "Wiki deleted successfully."
      redirect_to wikis_path
    else
      flash[:alert] = "Unable to delete wiki. Please try again."
      render :show
    end
  end

  private
  def wiki_params
    params.require(:wiki).permit(:title, :body, :private)
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

  def get_wiki
    begin
      Wiki.visible_to(current_user).find(params[:id])
    rescue
      flash[:alert] = "Unable to find that wiki."
      redirect_to wikis_path
    end
  end
end

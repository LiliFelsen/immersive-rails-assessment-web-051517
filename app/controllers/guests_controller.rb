class GuestsController < ApplicationController
before_action :set_guest, only: [:show, :appearance]


  def index
    @guests = Guest.all
  end

  def show
    @guest = Guest.find(params[:id])
  end

  def appearance
    @appearance = Appearance.create(episode_id:params[:appearance][:episode][:number], guest:set_guest, rating: params[:appearance][:rating])
    flash[:notice] = "Appearance added in episode #{params[:appearance][:episode][:number]}"
    redirect_to guest_path(set_guest)
  end

  private

  def set_guest
    @guest = Guest.find(params[:id])
  end

end

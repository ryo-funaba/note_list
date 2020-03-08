class NotesController < ApplicationController
  
  def index
    @notes = Note.order("created_at DESC").page(params[:page]).per(8)
  end
  
  def show
    @note = Note.find(params[:id])
    @reviews = @note.reviews.includes(:user)
  end
end

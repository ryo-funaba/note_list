class NotesController < ApplicationController
  
  def index
    @notes = Note.all
    # binding.pry
  end
  
  def show
    @note = Note.find(params[:id])
    @reviews = @note.reviews.includes(:user)
  end
end

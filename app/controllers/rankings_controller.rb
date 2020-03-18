class RankingsController < ApplicationController
  layout 'application'
  
  before_action :ranking
  
  def ranking
    note_ids = Review.group(:note_id).order('count_note_id DESC').limit(3).count(:note_id).keys
    @ranking = note_ids.map{ |id| Note.find(id) }
  end
end

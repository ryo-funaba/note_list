class RankingsController < ApplicationController
  layout 'application'
  
  before_action :ranking
  
  def ranking
    @ranking = Review.includes(:note).select('note_id, count(*) as note_count').group(:note_id).order('note_count desc').limit(3)
  end
end

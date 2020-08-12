class VotesController < ApplicationController
  def create
    @vote = current_user.votes.new(article_id: params[:article_id])
    if @vote.save
      flash.now[:notice] = 'Article upvoted!'
      redirect_to request.referer
    else
      flash.now[:alert] = 'Error!'
    end
  end

  def destroy
    @vote = Vote.find_by(id: params[:id], user: current_user, article_id: params[:article_id])
    if @vote
      @vote.destroy
      flash.now[:notice] = 'Arrticle downvoted!'
      redirect_to request.referer
    else
      flash.now[:alert] = 'You cannot downvote this article'
    end
  end
end

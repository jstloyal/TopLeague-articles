class VotesController < ApplicationController
  def create
    @vote = current_user.votes.new(article_id: params[:article_id])
    if @vote.save
      flash.now[:notice] = "Article upvoted!"
      redirect_to request.referer
    else
      flash[:alert] = "Error!"
    end
  end

  def destroy
    @vote = Vote.find_by(id: params[:id], user: current_user, article_id: params[article_id])
    if @vote
      @vote.destroy
      flash[:notice] = "Arrticle downvoted!"
      redirect_to request.referer
    else
      flash[:alert] = "You cannot downvote this article"
      redirect_to request.referer
    end
  end
end

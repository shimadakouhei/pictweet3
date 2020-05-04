class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @tweets = user.tweets.page(params[:page]).per(5).order("created_at DESC")
  end

  def edit
  end  

  def update
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params)
  end
  
  def show
    @comment = Comment.new
    @comments = @tweet.comments.includes(:user)
  end
end

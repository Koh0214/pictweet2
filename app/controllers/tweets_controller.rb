class TweetsController < ApplicationController
    before_action :move_to_index, except: :index 

  def index
    @tweets = Tweet.includes(:user).page(params[:page]).per(5).order("id DESC") # Tweet.all.order("id DESC")のallを省略できる。
  end


  def new
  end

  def create
    Tweet.create(image: tweet_params[:image], text: tweet_params[:text], user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy if current_user.id == tweet.user_id
  end

  private 
  def tweet_params
    params.permit(:image, :text)
  end

end

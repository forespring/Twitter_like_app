class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :update, :destroy]

  def index
    @tweets = Tweet.all.order("created_at DESC")
  end

  def new
    if params[:back]
      @tweet = Tweet.new(tweet_params)
    else
      @tweet = Tweet.new
    end
  end

  def edit
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path, notice: "ツイートを投稿しました"
    else
      render :index, notice: @tweet.errors
    end
  end

  def update
    if @tweet.update(tweet_params)
      redirect_to root_path(@tweet), notice: 'ツイートを更新しました'
    else
      render :edit, notice: @tweet.errors
    end
  end

  def destroy
    @tweet.destroy
    redirect_to tweets_url, notice: 'ツイートを削除しました'
  end

  def confirm
    @tweet = Tweet.new(tweet_params)
    render :new if @tweet.invalid?
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(:content)
  end
end

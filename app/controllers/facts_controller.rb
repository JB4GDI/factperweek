class FactsController < ApplicationController

  def index

    # This is for user-generated facts.  Grab a random one.
    @fact = Fact.order("RANDOM()").first
    @feedback = Feedback.new

    # Connect to the Twitter API
    twitter = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['CONSUMER_KEY']
      config.consumer_secret = ENV['CONSUMER_SECRET']
      config.access_token = ENV['YOUR_ACCESS_TOKEN']
      config.access_token_secret = ENV['YOUR_ACCESS_SECRET']
    end

    # Get the top 200 tweets from FactPerWeek
    tweets = twitter.user_timeline("factperweek", count: 200)

    # Pull the text out of all of them
    all_tweets = []
    tweets.each do |tweet|
      all_tweets << tweet.full_text
    end

    # Capture a random tweet for the index page
    @random_tweet = all_tweets.sample

  end

  def new
    @fact = Fact.new
  end

  def create
    @fact = Fact.create(fact_params)

    # Check for validity
    if @fact.invalid?
      flash[:error] = '<strong>Could not save</strong> the data you entered is invalid.'
    end

    redirect_to root_path
  end

  def show
    @fact = Fact.find(params[:id])
    @feedback = Feedback.new

  end

  private

  def fact_params
    params.require(:fact).permit(:tweet, :username)
  end

end
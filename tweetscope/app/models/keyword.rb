class Keyword < ActiveRecord::Base
    	has_many :tweets

    	def grab_twitts
      client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "maFVy6adF7oI7gpoY3SnJs9JF"
      config.consumer_secret     = "aeJpoyBf0IJCxLt0PF2MhqFx4gn41jLk2b72qbmxAcoZtDBNPb"
      config.access_token        = "198059700-zdPAR8SxoJjyvydk9nTWLeGHisR6PKQSJ8z7hbYL"
      config.access_token_secret = "QvANewJzzI4fM9NmMKmLEh95ICU2kd8eszXFVrLmL1rcs"
    end
    client.search(self.word, :count => 10, :result_type => "recent").take(10).collect do |tweet|
      new_tweet = Tweet.new
      
      new_tweet.tweet_id=tweet.id.to_s
      new_tweet.tweet_created_at=tweet.created_at
      new_tweet.text = tweet.text
      
      new_tweet.user_uid= tweet.user.id
      new_tweet.user_name=tweet.user.name
      new_tweet.user_screen_name=tweet.user.screen_name
      #new_tweet.user_image_url=tweet.user.profile_image_url

      new_tweet.keyword=self

      new_tweet.save

	 end
  end
end

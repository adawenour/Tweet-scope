class Keyword < ActiveRecord::Base
	def grab_twitts
		client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "maFVy6adF7oI7gpoY3SnJs9JF"
  config.consumer_secret     = "aeJpoyBf0IJCxLt0PF2MhqFx4gn41jLk2b72qbmxAcoZtDBNPb"
  config.access_token        = "198059700-zdPAR8SxoJjyvydk9nTWLeGHisR6PKQSJ8z7hbYL"
  config.access_token_secret = "QvANewJzzI4fM9NmMKmLEh95ICU2kd8eszXFVrLmL1rcs"
end
client.search(self.word, :count => 3, :result_type => "recent").take(3).collect do |tweet|
  "#{tweet.user.screen_name}: #{tweet.text}"
	end
  end
end

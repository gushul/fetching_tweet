class FetchTweet < ActiveRecord::Base
  validates :twitter_id, uniqueness: true
  scope :names, ->(name) { where("name LIKE ?" , name) }
end

class CreateFetchTweets < ActiveRecord::Migration
  def change
    create_table :fetch_tweets do |t|
      t.text :text
      t.string :name
      t.integer :twitter_id

      t.timestamps
    ***REMOVED***
  ***REMOVED***
***REMOVED***

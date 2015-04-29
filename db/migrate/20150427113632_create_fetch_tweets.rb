class CreateFetchTweets < ActiveRecord::Migration
  def change
    create_table :fetch_tweets do |t|
      t.text :text
      t.string :name
      t.column :twitter_id, :bigint

      t.timestamps
    ***REMOVED***
  ***REMOVED***
***REMOVED***

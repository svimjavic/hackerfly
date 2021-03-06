# == Schema Information
# Schema version: 2008100601002
#
# Table name: feeds
#
#  id           :integer       not null, primary key
#  profile_id   :integer       
#  feed_item_id :integer       
#

# == schema info
# schema ver: 
#
# table name: feeds
#
#  id           :integer       not null, primary key
#  profile_id   :integer       
#  feed_item_id :integer       
#

class Feed < ActiveRecord::Base
  belongs_to :feed_item
  belongs_to :profile
  attr_immutable :id, :profile_id, :feed_item_id
end

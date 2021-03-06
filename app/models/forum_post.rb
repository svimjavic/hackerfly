# == Schema Information
# Schema version: 2008100601002
#
# Table name: forum_posts
#
#  id         :integer       not null, primary key
#  body       :text          
#  owner_id   :integer       
#  topic_id   :integer       
#  created_at :datetime      
#  updated_at :datetime      
#

# == schema info
# schema ver: 
#
# table name: forum_posts
#
#  id         :integer       not null, primary key
#  body       :text          
#  owner_id   :integer       
#  topic_id   :integer       
#  created_at :datetime      
#  updated_at :datetime      
#

class ForumPost < ActiveRecord::Base
  validates_presence_of :body, :owner_id
  attr_immutable :id, :owner_id, :topic_id
  
  belongs_to :owner, :class_name => "Profile"
  belongs_to :topic, :class_name => "ForumTopic"
  
  after_create :update_topic
  after_create :notify_new_post
  
private
  def update_topic
    topic.update_attributes({:updated_at => Time.now})
  end
  
  def notify_new_post
    other_users = (topic.users - [owner.user])
    other_users.each do |user|
      ForumMailer.deliver_new_post(user,self)
    end
  end
  
end

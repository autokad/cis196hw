class Post < ActiveRecord::Base
  attr_accessible :text, :title
  belongs_to :user
  validates :user_id, presence: true
  validates_presence_of :title, :presence => { :message => "Need a Title" }
  validates_uniqueness_of :title, :presence => { :message => "Title must be unique =(" }
  validates :text, length: { minimum: 2 }
end

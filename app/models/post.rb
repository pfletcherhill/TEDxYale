class Post < ActiveRecord::Base
  attr_accessible :body, :title
  
  validates_presence_of :title
  validates_presence_of :body
end

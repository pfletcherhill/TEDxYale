class ApplicationCycle < ActiveRecord::Base
  
  attr_accessible :name, :description
  
  has_many :applications
  has_many :application_questions
  
  validates :name, presence: true
  
  before_create :make_slug
  
  def make_slug
    self.slug = self.name.downcase.strip
      .gsub(/ /, "-")
      .gsub(/[^\w\d\-_]/, "")
  end
end

class ApplicationCycle < ActiveRecord::Base
  
  attr_accessible :name, :description, :end_date
  
  has_many :applications
  has_many :application_questions
  
  validates :name, presence: true
  validates :end_date, presence: true
  
  before_create :make_slug
  
  def make_slug
    self.slug = self.name.downcase.strip
      .gsub(/ /, "-")
      .gsub(/[^\w\d\-_]/, "")
  end
end

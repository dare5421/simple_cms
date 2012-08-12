class Subject < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name, :position, :visible, :created_at
  # has_one :page
  has_many :pages

  validates_presence_of :name
  validates_length_of :name, :maximum => 255
  

  scope :visible, where(:visible => true) 
  scope :invisible, where(:visible => false) 
  scope :search, lambda { |query| where(["name LIKE ?", "%#{query}%"])}	
end
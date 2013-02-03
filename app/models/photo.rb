class Photo < ActiveRecord::Base
  attr_accessible :description, :title

  validates :title,  :presence => true
  has_many :comments
  belongs_to :album
  
  attr_accessible :image
  has_attached_file :image, :styles => {
  							 	:large => "1200x900>",
  							 	:medium => "1024x768>",
  							 	:thumb => "200x200#" 
  							 }


end

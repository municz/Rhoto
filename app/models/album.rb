class Album < ActiveRecord::Base
  attr_accessible :description, :name , :Cover

  validates :name, :presence => true,
                    :length => { :minimum => 5 }

  has_many :photos
end

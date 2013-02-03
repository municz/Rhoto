class Comment < ActiveRecord::Base
  
  attr_accessible :content, :title, :user

  belongs_to :photo

  validates :title,  :presence => true
  validates :content, :presence => true,
                    :length => { :minimum => 5 }
  validates :user , :presence=> true, :length=>{ :minimum=>5 }

  
end

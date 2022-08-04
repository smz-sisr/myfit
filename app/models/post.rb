class Post < ApplicationRecord
    belongs_to :user
    has_many :favorites, dependent: :destroy
    has_many :comments, dependent: :destroy
    
    
    
    validates :date, presence: true
    validates :meal_content, presence: true
    validates :training_content, presence: true
 
    
    
    
  

 

end

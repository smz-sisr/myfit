class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments
  
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         


         enum gender: { 男性: 1, 女性: 2} 
      
         
         scope :get_by_gender, ->(gender) {
                                            where(gender: gender)
                                          }
                                          
        scope :get_by_age, ->(age) {
                                    where("age >= ? and age < ?", age.to_i, age.to_i + 10 )
                                    }
                                    
         
         attachment :icon_image
         
         validates :name, presence: true
         
         def alredy_favorited?(post)
           self.favorites.exists?(post_id: post.id)
         end
       

end

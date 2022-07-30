class Post < ApplicationRecord
    belongs_to :user
    has_many :favorites, dependent: :destroy
    
    
    validates :date, presence: true
    validates :meal_content, presence: true
    validates :training_content, presence: true
 
    
    
    
    def self.filter_post_by_user_gender(g_id)
    # g_idは1が男性、2が女性
     posts = User.where(gender: g_id).map{|user|user.posts}
     return posts.flatten
    end
    
    def self.filter_post_by_user_age(age)
        posts = User.where("age >= ? and age < ?", age.to_i, age.to_i + 10 ).map{|user|user.posts}
        return posts.flatten
    end

 

end

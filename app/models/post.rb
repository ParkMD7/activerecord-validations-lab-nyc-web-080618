class Post < ActiveRecord::Base
  validates :title, uniqueness: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"] }
  validate :clickbait?


  def clickbait?
     buzzfeed = ["Won't Believe", "Secret", "Top [number]", "Guess"]
     if self.title == nil
       errors.add(:title, "Error: Each Post Must Have A Title!")
     elsif buzzfeed.none? do |clickbait|
       (self.title).include?(clickbait)
     end == true
         errors.add(:title, "GTFO of Here With That Clickbait")
     end
  end


end # end of Post Class

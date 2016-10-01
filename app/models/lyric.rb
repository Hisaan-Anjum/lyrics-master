class Lyric < ActiveRecord::Base
belongs_to :user
 before_save :mmdd
    
     def mmdd
        self.name.downcase!
        self.description.downcase!
        self.artist.downcase!

    end
def self.search(query5)
         puts query5
         where("name LIKE ? Or description LIKE?  Or artist LIKE?  Or lyrics LIKE? Or name LIKE? AND artist LIKE?",  "%#{query5.downcase}%" , "%#{query5.downcase}%" , "%#{query5.downcase}%","%#{query5.downcase}%","%#{query5.downcase}%","%#{query5.downcase}%")
     end
   
end

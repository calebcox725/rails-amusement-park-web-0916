class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if user.height < attraction.min_height || user.tickets < attraction.tickets
      sorry_arr = ["Sorry."]
      if user.tickets < attraction.tickets
        sorry_arr << "You do not have enough tickets to ride the #{attraction.name}."
      end
      if user.height < attraction.min_height
        sorry_arr <<"You are not tall enough to ride the #{attraction.name}."
      end
      sorry_arr.join(" ")
    else
      user.tickets -= attraction.tickets
      user.nausea += attraction.nausea_rating
      user.happiness += attraction.happiness_rating
      user.save
      "Thanks for riding the #{attraction.name}!"
    end
  end
end

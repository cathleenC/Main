class QueueModel < ActiveRecord::Base
	has_many :bookings
	has_many :users, :through => :bookings


	def nb_of_bookings
    	return Booking.where(start: self.id).count
    end

end

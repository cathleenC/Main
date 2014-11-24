class User < ActiveRecord::Base
	has_many :bookings
	has_many :queue_models, :through=> :bookings
end

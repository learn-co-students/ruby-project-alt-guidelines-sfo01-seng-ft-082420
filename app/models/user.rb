class User < ActiveRecord::Base
    has_many :buildings
    has_many :lockers, through: :buildings 

end 
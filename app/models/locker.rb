class Locker < ActiveRecord::Base
    has_many :buildings
    has_many :users, through: :buildings 
end 
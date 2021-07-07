class Building < ActiveRecord::Base
    belongs_to :locker
    belongs_to :user
end 

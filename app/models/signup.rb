class Signup < ApplicationRecord
    validate :check_for_time

    belongs_to :activity
    belongs_to :camper


    def check_for_time
        unless self.time>0 && self.time<23
            errors.add(:time, "Not a valid Time")
        end
    end
end

class Camper < ApplicationRecord
    validates :name, presence: true
    validate :check_age

    has_many :signups
    has_many :activities, through: :signups

    def check_age
        unless self.age >= 8 && self.age <= 18
            errors.add(:age, "Not a valid Age")
        end
    end

end

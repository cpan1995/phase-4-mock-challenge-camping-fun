class SignupSerializer < ActiveModel::Serializer
  attributes :id, :time, :belongs_to, :belongs_to

  belongs_to :activity
  belongs_to :camper

end
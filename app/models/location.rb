# == Schema Information
#
# Table name: locations
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Location < ApplicationRecord

  has_many :users,
    foreign_key: :location_id,
    class_name: 'User',
    primary_key: :id

  # same as:
  # has_many(:users,
  #   foreign_key: :location_id,
  #   class_name: 'User',
  #   primary_key: :id)

  has_many :blabs,
    through: :users,
    source: :authored_blabs
end

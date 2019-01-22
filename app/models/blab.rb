# == Schema Information
#
# Table name: blabs
#
#  id         :bigint(8)        not null, primary key
#  author_id  :integer
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Blab < ApplicationRecord
  # blabs has the foreign key of author_id so it 
  # will have a belongs_to association with users
  validates :body, presence: true

  # belongs_to association automatically validates
  # the presence of the foreign_key
  belongs_to :author,
    class_name: 'User',
    foreign_key: :author_id,
    primary_key: :id
    # optional: true

  has_one :location,
    through: :author,
    source: :location
end

class Skill < ApplicationRecord
  belongs_to :user

  validates :note, inclusion: { within: 0..5}
end

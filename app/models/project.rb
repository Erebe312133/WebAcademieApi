class Project < ApplicationRecord
  belongs_to :user
  has_many :links
  has_many :languages
end

class User < ApplicationRecord
  has_many :skills
  has_many :projects
end

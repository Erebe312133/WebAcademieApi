class User < ApplicationRecord
  has_many :skills
  has_many :projects

  scope :with_skill_type, ->(skill_type) {joins(:skills).where("skills.mtype = ? or skills.name = ?", skill_type, skill_type).uniq}
  scope :with_skill_type_and_note, ->(skill_type, note) {joins(:skills).where("skills.mtype = ? or skills.name = ?", skill_type, skill_type).where("skills.note = ?", note).uniq}
end

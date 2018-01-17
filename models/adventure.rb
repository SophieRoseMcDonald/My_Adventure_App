class Adventure < ActiveRecord::Base
  has_and_belongs_to_many :tags
  # has_many :adventures_tags
  # has_many :tags through: :adventures_tags
end

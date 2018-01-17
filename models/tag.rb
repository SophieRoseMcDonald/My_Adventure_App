class Tag < ActiveRecord::Base
  has_and_belongs_to_many :adventures
  # has_many :adventures through: :adventures_tags
end

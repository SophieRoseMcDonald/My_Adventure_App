class Adventure < ActiveRecord::Base
  has_and_belongs_to_many :tags

  def self.search(search)
    where("name like ?", "%#{search}%")
  end

end

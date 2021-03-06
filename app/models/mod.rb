class Mod < ApplicationRecord
  paginates_per 10

  after_validation :set_slug, only: [:create, :update]
  
  has_one :readme

  def set_slug
    self.slug = name.to_s.parameterize
  end
end

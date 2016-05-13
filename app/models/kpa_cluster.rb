class KpaCluster < ActiveRecord::Base
  # Associations
  has_many :projects

  # Methods
  def to_s
    "#{kpa_title}"
  end
end

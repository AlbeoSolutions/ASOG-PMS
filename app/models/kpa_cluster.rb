class KpaCluster < ActiveRecord::Base
  has_many :projects

  def to_s
    "#{kpa_title}"
  end
end

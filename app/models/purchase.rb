class Purchase < ActiveRecord::Base
  belongs_to :toy
  belongs_to :kid

  def info
    "#{kid.name} bought #{quantity} #{toy.name} toys."
  end
end

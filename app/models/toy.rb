class Toy < ActiveRecord::Base
  has_many :purchases
  has_many :kids, through: :purchases

  def self.most_expensive
    find_by(price: Toy.maximum(:price))
  end

  def self.most_popular
    purchased_most = all.map { |toy| toy.purchases.count }.max
    all.find { |toy| toy.purchases.count == purchased_most }
  end

  def kids_names
    kids.pluck(:name)
  end
end
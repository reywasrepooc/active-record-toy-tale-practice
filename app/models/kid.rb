class Kid < ActiveRecord::Base
  has_many :purchases
  has_many :toys, through: :purchases

  def make_purchase(toy:, quantity:)
    Purchase.create(toy: toy, quantity: quantity, kid: self)
  end

  def all_purchase_info
    purchases.map(&:info)
  end

  def throw_out(toy)
    purchases.find_by(toy_id: toy.id).quantity - 1
  end

  def throw_all_out(toy)
    purchases.find_by(toy: toy, kid: self).destroy
  end
end

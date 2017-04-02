class OrderItem < ApplicationRecord
	belongs_to :product
	belongs_to :order

	before_save :finalize

	def unit_price
    self[:unit_price]
  end

	def total_price
		unit_price * quantity
	end

	private

	def finalize
		self[:unit_price] = unit_price
		self[:total_price] = quantity * self[:unit_price]

	end
end

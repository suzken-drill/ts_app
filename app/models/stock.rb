class Stock < ApplicationRecord
	belongs_to :item

	# constant

	# validate
	validates :item_number, presence: { message: I18n.t(:item_number_blank_error) }
	validates :stock, numericality: { only_integer: true, message: I18n.t(:stock_value_error) }
end

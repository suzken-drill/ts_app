class Item < ApplicationRecord
	has_many :stocks, dependent: :destroy
	has_one :item_category_relation, dependent: :destroy
	has_one :category, through: :item_category_relation

	# constant
	REGISTRABLE_ATTRIBUTES = %i(item_number title price content content_simple image_url sale_start_at image_1 image_2 image_3 image_4 image_5 image_6 wholesale_price postage include_devision packing_size shipment_from shipment_to strick_price lower_price)
	PER = 10

	# validate
	validates :item_number, presence: { message: I18n.t(:item_number_blank_error, scope: [:activerecord, :errors, :models, :item, :attributes, :item_number]) }
	validates :title, presence: { message: I18n.t(:title_blank_error, scope: [:activerecord, :errors, :models, :item, :attributes, :title]) }
	validates :price, presence: { message: I18n.t(:price_blank_error, scope: [:activerecord, :errors, :models, :item, :attributes, :price]) }, numericality: { only_integer: { message: I18n.t(:price_only_integer) }, greater_than: 0 }
	validates :content, presence: { message: I18n.t(:content_blank_error, scope: [:activerecord, :errors, :models, :item, :attributes, :content]) }
	validates :wholesale_price, presence: { message: I18n.t(:wholesale_price_blank_error, scope: [:activerecord, :errors, :models, :item, :attributes, :wholesale_price]) }
	validate :price_check

	# scope
	scope :with_stock, -> { includes(:stock) }

	def price_check
		return true unless self.price.present? && self.wholesale_price.present?
		if self.price < self.wholesale_price
			errors.add(:price, I18n.t(:greater_than_wholesale_price, scope: [:activerecord, :errors, :models, :item, :attributes, :price]))
		end
	end
end

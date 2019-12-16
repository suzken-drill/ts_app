class Item < ApplicationRecord
	has_many :stocks, dependent: :destroy
	has_one :item_category_relation, dependent: :destroy
	has_one :category, through: :item_category_relation

	# constant


	# validate
	validates :item_number, presence: { message: I18n.t(:item_number_blank_error) }
	validates :title, presence: { message: I18n.t(:name_blank_error) }
	validates :price, presence: { message: I18n.t(:price_blank_error) }
	validates :content, presence: { message: I18n.t(:content_blank_error) }
	validates :wholesale_price, prisence: { message: I18n.t(:wholesale_price_blank_error) }

	# scope
	scope :with_stock, -> { includes(:stock) }

end

class Category < ApplicationRecord
	has_many :item_category_relations
	has_one :item, through: :item_category_relation
	has_many :sub_categories, class_name: "Category", foreign_key: "parent_id"
	belongs_to :parent_category, class_name: "Category", foreign_key: "parent_id", optional: true

	# constant


	# validate
	validates :title, presence: { message: I18n.t(:title_blank_error) }
end

class Admin < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable,
           :confirmable, :lockable, :timeoutable, :trackable

	# constant

	# validate
	validates :name, presence: { message: I18n.t(:name_blank_error) }
end

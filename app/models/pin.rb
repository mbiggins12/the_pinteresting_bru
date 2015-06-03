class Pin < ActiveRecord::Base
	validates :description, :image, presence: true

	belongs_to :user
	has_many :boards
end

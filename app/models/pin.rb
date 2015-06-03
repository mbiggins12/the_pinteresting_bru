class Pin < ActiveRecord::Base
	validates :description, :image, presence: true


	belongs_to :board
end

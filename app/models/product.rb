class Product < ApplicationRecord
	validates :title, :description, :image_url, :price, presence: true
	validates :title, uniqueness: true
	validates :title, length: { minimum: 10 }
	validates :price, numericality: { greater_than_or_equal_to: 0.01 }
	has_many :line_items
	before_destroy :ensure_not_referenced_by_any_line_item
	
	private
    # ensure that there are no line items referencing this product
		def ensure_not_referenced_by_any_line_item 
			unless line_items.empty?
				errors.add(:base, 'Line Items present')
				throw :abort 
			end
		end

end

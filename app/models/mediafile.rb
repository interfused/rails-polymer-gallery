class Mediafile < ApplicationRecord
	before_save { self.category = category.downcase }
end

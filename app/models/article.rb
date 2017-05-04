class Article < ApplicationRecord
	has_many	:comments, dependent: :destroy
	#validation http://guides.rubyonrails.org/active_record_validations.html
	validates :title, presence: true,
                    length: { minimum: 5 }
	validates :text, presence: true,
                    length: { minimum: 10 }                  
end

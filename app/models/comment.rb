class Comment < ApplicationRecord
  belongs_to :article

  #validation http://guides.rubyonrails.org/active_record_validations.html
	validates :commenter, presence: true,
                    length: { minimum: 5 }
	validates :body, presence: true,
                    length: { minimum: 10 }       
end

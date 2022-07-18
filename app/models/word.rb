# Word model
class Word < ApplicationRecord
  has_many :synonyms, dependent: :destroy, inverse_of: :word

  enum status: { pending: 0, approved: 1 }
end

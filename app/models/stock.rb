class Stock < ApplicationRecord
  belongs_to :account, inverse_of: :stocks
end

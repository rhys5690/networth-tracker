class Stock < ApplicationRecord
  belongs_to :account, inverse_of: :stocks, dependent: :destroy
end

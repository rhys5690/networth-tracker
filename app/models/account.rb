class Account < ApplicationRecord
  belongs_to :user
  has_many :stocks, inverse_of: :account, dependent: :destroy
  accepts_nested_attributes_for :stocks
  validates :account_1_total, presence: true

  def get_stock_data
    @stock_name = stocks.first.stock_symbol.downcase
    response = HTTParty.get("https://www.alphavantage.co/query?function=TIME_SERIES_DAILY_ADJUSTED&symbol=#{@stock_name}&apikey=P220BS7L3ML520RS")
    response["Time Series (Daily)"].first.second["4. close"]
  end
end

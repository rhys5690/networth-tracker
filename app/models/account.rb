class Account < ApplicationRecord
  belongs_to :user
  validates :account_1_total, presence: true

  def get_stock_data
    @stock_name = self.stock_name.downcase
    response = HTTParty.get("https://www.alphavantage.co/query?function=TIME_SERIES_DAILY_ADJUSTED&symbol=#{@stock_name}&apikey=P220BS7L3ML520RS")
    response["Time Series (Daily)"].first.second["4. close"]
  end
end

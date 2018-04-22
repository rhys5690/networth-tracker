class Account < ApplicationRecord
  belongs_to :user

  def get_stock_data
    response = HTTParty.get('https://www.alphavantage.co/query?function=TIME_SERIES_DAILY_ADJUSTED&symbol=ASX:FLN&apikey=P220BS7L3ML520RS')
    response["Time Series (Daily)"].first.second["4. close"]
  end
end

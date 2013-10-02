class SalesdateController < ApplicationController
  def index
    httpClient = HTTPClient.new

    @jsonData = nil
    @errorMeg = nil

    begin
      data = httpClient.get_content('https://app.rakuten.co.jp/services/api/BooksGame/Search/20130522', {
          'applicationId' => ENV['App_id'],
          'affiliateId'   => ENV['Affiliate_id'],
          'booksGenreId'  => '006',
          'sort'          => '-releaseDate'
      })
      @jsonData = JSON.parse data
      p @jsonData
    rescue HTTPClient::BadResponseError => e
    rescue HTTPClient::TimeoutError => e
    end

    render 'salesdate/index'
  end
end

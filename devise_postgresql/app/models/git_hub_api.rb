class GitHubApi
  class LimitationError < StandardError; end

  class << self
    def search(query = "")
      conn = Faraday.new('https://api.github.com/search') do |builder|
        builder.response :logger, Rails.logger
        builder.response :json
      end
      response = conn.get('/repositories', {q: query})

      if response.status == 403
        raise LimitationError, response.headers['x-ratelimit-reset'].to_i
      end

      response.body.map {|item| GitHubRepository.new(item.slice('id', 'full_name', 'description')) }
    end
  end
end

class GitHubApi
  class << self
    def search(query = "")
      conn = Faraday.new('https://api.github.com/search') do |builder|
        builder.response :logger, Rails.logger
        builder.response :json
      end
      response = conn.get('/repositories', {q: query})

      if response.status != 200
        return []
      end

      response.body.map {|item| GitHubRepository.new(item.slice('id', 'full_name', 'description')) }
    end
  end
end

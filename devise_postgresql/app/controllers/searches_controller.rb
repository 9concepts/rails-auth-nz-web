class SearchesController < ApplicationController
  def index
  end

  def search
    @query = params[:query]
    @repositories = GitHubApi.search(@query)
  end
end

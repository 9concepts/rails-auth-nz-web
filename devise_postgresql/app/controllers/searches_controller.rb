class SearchesController < ApplicationController
  def index
  end

  def search
    @query = params[:query]
    @repositories = GitHubApi.search(@query)
  rescue GitHubApi::LimitationError => e
    flash[:alert] = "API 呼び出し上限に達しました。#{Time.at(e.message.to_i)} までお待ちください。"
  end
end

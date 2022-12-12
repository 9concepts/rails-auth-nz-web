class GitHubRepository
  include ActiveModel::API

  attr_accessor :id, :full_name, :description
end

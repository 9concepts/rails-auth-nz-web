require 'rails_helper'

RSpec.describe GitHubApi, type: :model do
  describe '.search' do
    context '正常系' do
      it 'returns search results', vcr: true do
        repositories = GitHubApi.search("rails")

        expect(repositories[0]).to have_attributes(
          id: 1,
          full_name: 'mojombo/grit',
          description: '**Grit is no longer maintained. Check out libgit2/rugged.** Grit gives you object oriented read/write access to Git repositories via Ruby.'
        )
      end
    end
  end
end

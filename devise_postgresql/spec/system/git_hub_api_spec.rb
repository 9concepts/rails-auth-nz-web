require 'rails_helper'

RSpec.describe 'Call GitHub API', type: :system do
  let(:password) { '9sako6test' }
  let(:user) { FactoryBot.create(:user, password: password) }
  let(:repos) { FactoryBot.build_list(:git_hub_repository, 10) }

  before do
    allow(GitHubApi).to receive(:search).and_return(repos)
  end

  it 'shows search results' do
    visit root_path
    fill_in 'メールアドレス', with: user.email
    fill_in 'パスワード', with: password
    click_button 'ログイン'

    visit github_path
    expect(page).to have_content 'GitHub 検索'

    fill_in 'query', with: 'ocaml'
    click_button '検索'

    repos.each do |repo|
      expect(page).to have_content repo.id
    end
  end
end

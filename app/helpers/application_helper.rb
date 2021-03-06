# frozen_string_literal: true

module ApplicationHelper
  def year_today
    Time.zone.now.year
  end

  def github_url(author, repo)
    "https://github.com/#{author}/#{repo}"
  end
end

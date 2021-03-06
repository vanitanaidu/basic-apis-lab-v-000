class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = ENV['CLIENT_ID']
      req.params['client_secret'] = ENV['CLIENT_SECRET']
      req.params['v'] = '20170822'
      req.params['q'] = params[:query]
      req.params['sort'] = 'forks'
      req.params['order'] = 'desc'
    end
    body_hash = JSON.parse(@resp.body)
    @items = body_hash["items"]
    render 'search'
  end

end

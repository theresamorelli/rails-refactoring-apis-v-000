class RepositoriesController < ApplicationController
  def index
    response = Faraday.get "https://api.github.com/user/repos", {}, {'Authorization' => "token #{session[:token]}", 'Accept' => 'application/json'}
    # github = GithubService.new
    @repos_array = JSON.parse(response.body)
    # github.get_repos
  end

  def create
    github = GithubService.new
    github.create_repo(params[:name])
    redirect_to '/'
  end
end

class SearchController < ApplicationController
  def index
    Store.search_by_zip(safe_params)
  end

  private

  def safe_params
    params.permit(:search)
  end
end

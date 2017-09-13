class SearchController < ApplicationController
  def index
    stores = Store.search_by_zip(safe_params)
    @presenter = SearchPresenter.new(stores)
  end

  private

  def safe_params
    params.permit(:search)
  end
end

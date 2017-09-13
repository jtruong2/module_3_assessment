class SearchPresenter < BasePresenter
  def stores(stores)
    stores.map do |store|
      SearchStore.new(store)
    end
  end
end

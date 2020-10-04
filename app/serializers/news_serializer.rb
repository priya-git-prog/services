class NewsSerializer < ActiveModel::Serializer
  # attributes *News.column_names
  attributes :status, :totalResults, :articles #To exclude id, created_at, updated_at
end

json.extract! category, :id, :term_wp_id, :name, :slug, :term_group, :term_taxonomy_id, :taxonomy, :description, :parent_wp_id, :count, :filter, :parent_id, :created_at, :updated_at
json.url category_url(category, format: :json)

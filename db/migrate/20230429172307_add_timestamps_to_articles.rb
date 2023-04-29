class AddTimestampsToArticles < ActiveRecord::Migration[5.1]
  def change
              #table  field_name field_type
    add_column :articles, :created_at, :datetime
    add_column :articles, :updated_at, :datetime
  end
end

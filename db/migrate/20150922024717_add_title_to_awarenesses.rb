class AddTitleToAwarenesses < ActiveRecord::Migration
  def change
    add_column :awarenesses, :title, :string
  end
end

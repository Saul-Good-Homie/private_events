class AddFieldsToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :description, :string
    add_column :events, :location, :string
    add_column :events, :date, :datetime
  end
end

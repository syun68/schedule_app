class AddContentToSchedules < ActiveRecord::Migration[7.0]
  def change
    add_column :schedules, :content, :string
  end
end

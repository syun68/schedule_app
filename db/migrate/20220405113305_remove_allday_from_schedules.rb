class RemoveAlldayFromSchedules < ActiveRecord::Migration[7.0]
  def change
    remove_column :schedules, :allday, :string
  end
end

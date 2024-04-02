class ChangeDatatypestartDateOfTasks < ActiveRecord::Migration[6.1]
  def change
    change_column :tasks, :start_date, :datetime
  end
end

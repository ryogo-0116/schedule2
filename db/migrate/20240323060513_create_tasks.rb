class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.time :start_date
      t.time :end_date
      t.boolean :is_all_day
      t.string :memo

      t.timestamps
    end
  end

end


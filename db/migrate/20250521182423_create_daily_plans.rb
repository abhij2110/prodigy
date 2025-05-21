class CreateDailyPlans < ActiveRecord::Migration[5.1]
  def change
    create_table :daily_plans do |t|
      t.integer :day
      t.references :program, foreign_key: true
      t.references :activity, foreign_key: true

      t.timestamps
    end
  end
end

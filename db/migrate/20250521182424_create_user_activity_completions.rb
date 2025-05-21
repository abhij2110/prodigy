class CreateUserActivityCompletions < ActiveRecord::Migration[5.1]
  def change
    create_table :user_activity_completions do |t|
      t.references :user, foreign_key: true
      t.references :daily_plan, foreign_key: true
      t.datetime :completed_at

      t.timestamps
    end
  end
end

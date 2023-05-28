class AddColumnsInUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string
    add_column :users, :expected_ctc, :float
    add_column :users, :interview_date, :date
    add_column :users, :interview_time, :time
    add_column :users, :interview_datetime, :datetime
    add_column :users, :weekly_off, :string
    add_column :users, :gender, :string
  end
end

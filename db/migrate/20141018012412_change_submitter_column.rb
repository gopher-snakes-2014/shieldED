class ChangeSubmitterColumn < ActiveRecord::Migration
  def change
  	remove_column :events, :submitter
  	add_column :events, :submitter, :integer
  end
end

class ChangeSubmitterColumnAgain < ActiveRecord::Migration
  def change
    change_column :events, :submitter, :string
  end
end

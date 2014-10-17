class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
    	t.string :details
    	t.string :submitter
    	t.string :offender
    	t.string :location
    	t.date	 :date
    	t.timestamps
    end
  end
end

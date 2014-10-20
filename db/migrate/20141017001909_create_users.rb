class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_hash #CR rails bCrypt uses password_digest
      t.string :level
    end
  end
end

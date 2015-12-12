class CreateTraders < ActiveRecord::Migration
  def change
    create_table :traders do |t|
      t.string :tradername
      t.string :email
      t.timestamps
    end
  end
end

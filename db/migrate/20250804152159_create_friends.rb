class CreateFriends < ActiveRecord::Migration[8.0]
  def change
    create_table :friends do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :twiter
      t.string :name
      t.text :comment
      t.integer :age_num
      t.date :birth_date
      t.float :salary_amt
      t.boolean :isbest

      t.timestamps
    end
  end
end

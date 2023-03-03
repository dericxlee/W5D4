class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, null: false

      t.index :email, unique: true #new instances cannot use preexisting emails
      # add_index :users, :email

      t.timestamps
    end
  end
end

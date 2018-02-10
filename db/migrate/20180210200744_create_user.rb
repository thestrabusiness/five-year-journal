class CreateUser < ActiveRecord::Migration[5.1]
  def change
    create_table :users, id: :uuid do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, null: false, index: true
      t.string :password_digest, null: false

      t.timestamps null: false
    end

    add_reference :entries, :user, index: true, foreign_key: true, null: false, type: :uuid
  end
end

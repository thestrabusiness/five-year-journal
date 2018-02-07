class CreateEntry < ActiveRecord::Migration[5.1]
  def change
    enable_extension 'pgcrypto'

    create_table :entries, id: :uuid do |t|
      t.text :body, null: false
      t.timestamps null: false
    end
  end
end

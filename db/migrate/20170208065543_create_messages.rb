class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :body, null: false
      t.string :image
      t.references :user,  null: false, index: true, unique: true
      t.references :group, null: false, index: true, unique: true
      t.timestamps
    end
  end
end

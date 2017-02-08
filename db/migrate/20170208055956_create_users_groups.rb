class CreateUsersGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :users_groups do |t|
      t.references :user,  null: false, index: true
      t.references :group, null: false, index: true
      t.timestamps
    end
  end
end

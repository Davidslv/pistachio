class CreateAdminAllowedAreas < ActiveRecord::Migration[7.0]
  def change
    create_table :admin_allowed_areas do |t|
      t.string :area

      t.timestamps
    end

    add_index :admin_allowed_areas, :area, unique: true
  end
end

class CreateAdminAllowedPostcodes < ActiveRecord::Migration[7.0]
  def change
    create_table :admin_allowed_postcodes do |t|
      t.string :postcode

      t.timestamps
    end
  end
end

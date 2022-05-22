class AddIndexToAdminAllowedPostcodes < ActiveRecord::Migration[7.0]
  def change
    add_index :admin_allowed_postcodes, :postcode
  end
end

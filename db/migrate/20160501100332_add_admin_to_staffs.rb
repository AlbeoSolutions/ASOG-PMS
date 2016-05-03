class AddAdminToStaffs < ActiveRecord::Migration
  def change
    add_column :staffs, :admin, :boolean, default: false
  end
end

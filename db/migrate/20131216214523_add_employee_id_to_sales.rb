class AddEmployeeIdToSales < ActiveRecord::Migration
  def up
    add_column :sales, :employee_id, :integer
  end
  def down
    remove_column :sales, :employee_id
  end
end

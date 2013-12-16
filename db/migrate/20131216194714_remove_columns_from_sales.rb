class RemoveColumnsFromSales < ActiveRecord::Migration
  def up
    remove_column :sales, :employee
    remove_column :sales, :customer_and_account_no
    remove_column :sales, :product_name
  end
  def down
    add_column :sales, :employee, :string
    add_column :sales, :customer_and_account_no, :string
    add_column :sales, :product_name, :string
  end
end

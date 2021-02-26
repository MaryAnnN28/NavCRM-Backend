class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :company
      t.string :job_title
      t.string :industry
      t.string :email
      t.string :phone
      t.text :notes

      t.timestamps
    end
  end
end

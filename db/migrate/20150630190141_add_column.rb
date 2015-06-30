class AddColumn < ActiveRecord::Migration
  def change
    add_column :reports, :assembly_id, :integer
  end
end

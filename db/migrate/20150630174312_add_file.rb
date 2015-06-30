class AddFile < ActiveRecord::Migration
  def change
    add_attachment :assemblies, :uploaded_file
  end
end

class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :words, :value, :content
  end
end

class RemoveLanguageFromWords < ActiveRecord::Migration[6.1]
  def change
    remove_column :words, :language
  end
end

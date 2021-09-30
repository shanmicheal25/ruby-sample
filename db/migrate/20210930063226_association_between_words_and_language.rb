class AssociationBetweenWordsAndLanguage < ActiveRecord::Migration[6.1]
  def change
    add_reference :words, :language, index:true, foreign_key:true
  end
end

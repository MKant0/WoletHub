class ChangeTypeInMovementsToMovementType < ActiveRecord::Migration[7.0]
  def change
    rename_column :movements, :type, :movement_type
  end
end

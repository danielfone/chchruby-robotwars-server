class AddTotalToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :total, :decimal, index: true
  end
end

class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :path

      t.timestamps
    end
  end
end

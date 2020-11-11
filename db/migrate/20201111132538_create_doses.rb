class CreateDoses < ActiveRecord::Migration[6.0]
  def change
    create_table :doses do |t|

      t.timestamps
    end
  end
end

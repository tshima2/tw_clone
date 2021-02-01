class CreateTwts < ActiveRecord::Migration[5.2]
  def change
    create_table :twts do |t|
      t.string :content
    end
  end
end

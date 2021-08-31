class CreateKids < ActiveRecord::Migration[6.1]
  def change
    create_table :kids do |t|
      t.string :name
    end
  end
end

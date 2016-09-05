class Schema < ActiveRecord::Migration
  def change
    create_table :toy_robots, force: true do |t|
      t.string :x
      t.string :y
      t.string :facing
    end

    create_table :movements, force: true do |t|
      t.string :name
      t.belongs_to :toy_robots, index: true
    end
  end

end

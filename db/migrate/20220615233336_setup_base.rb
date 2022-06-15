class SetupBase < ActiveRecord::Migration[6.1]
  def change

    create_table :areas do |t|
      t.string :name
      t.text :description
      t.string :slug
      t.timestamps null: false
    end
    add_index :areas, :slug, unique: true

    create_table :provinces do |t|
      t.string :name
      t.text :description
      t.string :slug
      t.timestamps null: false
    end
    add_index :provinces, :slug, unique: true

    create_table :schools do |t|
      t.string :code
      t.string :name
      t.string :slug
      t.string :address
      t.string :school_type
      t.integer :phone
      t.string :website
      t.references :area
      t.references :province
      t.timestamps null: false
    end

    create_table :school_info do |t|
      t.references :school
      t.integer :year
      t.string :objective
      t.text :scope
      t.string :method
      t.string :criteria
      t.text :threshold
      t.string :slug
      t.string :info
      t.string :incorporation
      t.string :policy
      t.string :fees
      t.string :tuition
      t.timestamps null: false
    end
    add_index :school_info, :slug, unique: true

  end
end


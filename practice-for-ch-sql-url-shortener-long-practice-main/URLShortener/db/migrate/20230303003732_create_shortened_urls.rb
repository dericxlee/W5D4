class CreateShortenedUrls < ActiveRecord::Migration[7.0]
  def change
    create_table :shortened_urls do |t|
      t.string :short_url, null: false
      t.string :long_url, null: false
      t.references :submitter, null: false, foreign_key:{to_table: :users}

      t.index :short_url, unique: true
      t.index :long_url, unique: true
      t.timestamps
    end
  end
end

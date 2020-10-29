class CreateGames < ActiveRecord::Migration[6.0]
  def change
	enable_extension 'uuid-ossp'
    enable_extension 'pgcrypto'

    create_table :games, id: :uuid do |t|
      t.text :sgf

      t.timestamps
    end
  end
end

class ExchangeRates < ActiveRecord::Migration[5.2]
  def change
    create_table :exchange_rates do |t|
      t.datetime   :expired_at, null: false
      t.float       :rate,       null: false
      t.timestamps
    end

    add_index :exchange_rates, :expired_at
  end
end

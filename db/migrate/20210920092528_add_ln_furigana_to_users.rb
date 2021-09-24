class AddLnFuriganaToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :ln_furigana, :string
  end
end

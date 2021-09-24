class AddFnFuriganaToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :fn_furigana, :string
  end
end

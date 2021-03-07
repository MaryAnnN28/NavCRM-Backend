class RemoveGoogleTokenFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :google_token, :string
  end
end

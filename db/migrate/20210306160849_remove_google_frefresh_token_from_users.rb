class RemoveGoogleFrefreshTokenFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :google_refresh_token, :string
  end
end

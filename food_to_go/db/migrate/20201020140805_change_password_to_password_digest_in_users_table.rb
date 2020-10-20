class ChangePasswordToPasswordDigestInUsersTable < ActiveRecord::Migration
  def change
    rename_column :users, :password, :password_digest
  end
end

#will change the password for better encryption.

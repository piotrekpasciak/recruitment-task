class AddAvatarToDevelopers < ActiveRecord::Migration
  def change
    add_column :developers, :avatar, :string
  end
end

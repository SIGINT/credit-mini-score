class AddNumConnectionsColumnToSocialMediaPresences < ActiveRecord::Migration
  def change
    add_column :social_media_presences, :num_connections, :integer
  end
end

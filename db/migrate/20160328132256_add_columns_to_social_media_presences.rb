class AddColumnsToSocialMediaPresences < ActiveRecord::Migration
  def change
    add_column :social_media_presences, :o_auth_token, :string
    add_column :social_media_presences, :is_o_auth_token_active, :boolean
    add_column :social_media_presences, :o_auth_token_expiration, :datetime
  end
end

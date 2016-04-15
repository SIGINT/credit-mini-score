class AddProviderColumnToSocialMediaPresences < ActiveRecord::Migration
  def change
    add_column :social_media_presences, :provider, :string
  end
end

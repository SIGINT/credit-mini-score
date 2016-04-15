class ChangeSiteIdToUid < ActiveRecord::Migration
  def change
    rename_column :social_media_presences, :site_id, :uid
  end
end

class CreateSocialMediaPresences < ActiveRecord::Migration
  def change
    create_table :social_media_presences do |t|
      t.string :business_id
      t.string :business_owner_id
      t.string :social_media_site
      t.string :site_url
      t.string :site_id

      t.timestamps null: false
    end
  end
end

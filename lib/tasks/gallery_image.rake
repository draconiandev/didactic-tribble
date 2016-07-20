namespace :gallery_image do
  desc "TODO"
  task reprocess: :environment do
    Gallery.all.each do |gal|
      gal.image.recreate_versions!
      end
  end
end

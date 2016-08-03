namespace :gallery_image do
  desc "reprocesses all the images of the gallery model"
  task reprocess: :environment do
    Gallery.all.each do |gal|
      gal.image.recreate_versions!
      end
  end
end

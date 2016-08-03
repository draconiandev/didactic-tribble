namespace :cover_image do
  desc "it reprocesses the cover images of all the classes"
  task reprocess: :environment do
    Activity.all.each do |activity|
      activity.cover.recreate_versions!
    end
    Destination.all.each do |destination|
      destination.cover.recreate_versions!
    end
    Category.all.each do |category|
      category.cover.recreate_versions!
    end
  end

end

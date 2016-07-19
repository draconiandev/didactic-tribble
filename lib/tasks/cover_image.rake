namespace :cover_image do
  desc "TODO"
  task reprocess: :environment do
    # [Activity, Destination, Category].each do |klass|
    #   klass.cover.recreate_versions!
    # end
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

class UpdateHeroesWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  sidekiq_options retry: false, backtrace: true

  recurrence do
    daily
  end

  def perform
    Dota.api.heroes.each do |hero|
      new_hero = Hero.find_or_initialize_by(name: hero.name)
      new_hero.update_attributes(
        dota_id: hero.id,
        image_url: hero.image_url)
    end
  end
end

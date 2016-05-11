require 'rails_helper'

RSpec.describe UpdateHeroesWorker do
  context '#perform' do
    let(:worker)    { UpdateHeroesWorker.new }
    let(:dota_api)  { double(:dota_api)      }
    let(:hero_name) { 'antimage'             }

    let(:heroes_response) do
      double(
        :hero,
        id: 1,
        image_url: 'image-url',
        name: hero_name)
    end

    before do
      expect(Dota).to receive(:api) { dota_api }
      expect(dota_api).to receive(:heroes) { [heroes_response] }
    end

    context 'when hero exists' do
      let!(:hero) { create(:hero, name: hero_name, dota_id: 69) }

      it 'creates a new hero' do
        worker.perform
        hero.reload

        expect(hero.dota_id).to eq 1
      end
    end

    context 'when hero does not exist' do
      it 'creates a new hero' do
        expect{ worker.perform }.to change { Hero.count }.by(1)
      end
    end
  end
end

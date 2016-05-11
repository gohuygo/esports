require 'rails_helper'

RSpec.describe UpdateHeroesWorker do
  context '#perform' do
    let(:worker)        { UpdateHeroesWorker.new }
    let(:dota_api)      { double(:dota_api)      }
    let(:internal_name) { 'antimage'             }

    let(:heroes_response) do
      double(
        :hero,
        internal_name: internal_name,
        id: 1,
        image_url: 'image-url',
        name: 'AM')
    end

    before do
      expect(Dota).to receive(:api) { dota_api }
      expect(dota_api).to receive(:heroes) { [heroes_response] }
    end

    context 'when hero exists' do
      let!(:hero) { create(:hero, internal_name: internal_name, name: 'AM') }

    end

    context 'when hero does not exist' do
      it 'creates a new hero' do
        expect{ worker.perform }.to change { Hero.count }.by(1)
      end
    end
  end
end

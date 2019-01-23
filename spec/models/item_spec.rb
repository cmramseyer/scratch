require 'rails_helper'

RSpec.describe Item, type: :model do
  context 'an item' do

    let(:item) { Item.new(item_name: "BackScratch", item_description: "BackScratch", item_cost: 12.34) }

    it 'is valid' do
      expect(item.valid?).to be true
    end

    it 'is not valid when item_name is greather than 50' do
      item.item_name = 'AAAAAAAAA_AAAAAAAAA_AAAAAAAAA_AAAAAAAAA_AAAAAAAAA_A'
      expect(item.valid?).to be false
    end

    it 'is not valid when item_name is not present' do
      item.item_name = ''
      expect(item.valid?).to be false
    end

    it 'is not valid when item_description is greather than 100' do
      item.item_description = 'AAAAAAAAA_AAAAAAAAA_AAAAAAAAA_AAAAAAAAA_AAAAAAAAA_AAAAAAAAA_AAAAAAAAA_AAAAAAAAA_AAAAAAAAA_AAAAAAAAA_A'
      expect(item.valid?).to be false
    end

    it 'is not valid when item_description is not present' do
      item.item_description = ''
      expect(item.valid?).to be false
    end

    it 'is not valid when item_cost is zero' do
      item.item_cost = 0
      expect(item.valid?).to be false
    end

    it 'is not valid when item_cost is negative' do
      item.item_cost = -1.0
      expect(item.valid?).to be false
    end
    
  end
end

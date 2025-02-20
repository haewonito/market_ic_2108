require 'rspec'
require './lib/item'
require './lib/vendor'
require './lib/market'


RSpec.describe Market do

  context 'Iteration 2' do

    before (:each) do
      @market = Market.new("South Pearl Street Farmers Market")

      @vendor1 = Vendor.new("Rocky Mountain Fresh")

      @item1 = Item.new({name: 'Peach', price: "$0.75"})
      @item2 = Item.new({name: 'Tomato', price: "$0.50"})
      @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
      @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

      @vendor1.stock(@item1, 35)
      @vendor1.stock(@item2, 7)

      @vendor2 = Vendor.new("Ba-Nom-a-Nom")

      @vendor2.stock(@item4, 50)
      @vendor2.stock(@item3, 25)

      @vendor3 = Vendor.new("Palisade Peach Shack")

      @vendor3.stock(@item1, 65)

      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)
      @market.add_vendor(@vendor3)
    end

    it 'exists with name and vendors' do
      expect(@market.name).to eq("South Pearl Street Farmers Market")
      #expect(@market.vendors).to eq([]) forgot about this when I was setting up (:each) but moving on for the sake of time
    end

    it '#add_vendor' do
      expect(@market.vendors).to eq([@vendor1, @vendor2, @vendor3])
    end

    it '#vendor_names' do
      expect(@market.vendor_names).to eq(["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
    end

    it '#vendors_that_sell' do
      expect(@market.vendors_that_sell(@item1)).to eq([@vendor1, @vendor3])
      expect(@market.vendors_that_sell(@item4)).to eq([@vendor2])
    end

    it '#potential_revenue' do
      expect(@vendor1.potential_revenue).to eq(29.75)
      expect(@vendor2.potential_revenue).to eq(345.00)
      expect(@vendor3.potential_revenue).to eq(48.75)
    end
  end

  context 'Iteration 2' do

    before (:each) do
      @market = Market.new("South Pearl Street Farmers Market")

      @vendor1 = Vendor.new("Rocky Mountain Fresh")

      @item1 = Item.new({name: 'Peach', price: "$0.75"})
      @item2 = Item.new({name: 'Tomato', price: "$0.50"})
      @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
      @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

      @vendor1.stock(@item1, 35)
      @vendor1.stock(@item2, 7)

      @vendor2 = Vendor.new("Ba-Nom-a-Nom")

      @vendor2.stock(@item4, 50)
      @vendor2.stock(@item3, 25)

      @vendor3 = Vendor.new("Palisade Peach Shack")

      @vendor3.stock(@item1, 65)
      @vendor3.stock(@item3, 10)


      @market.add_vendor(@vendor1)
      @market.add_vendor(@vendor2)
      @market.add_vendor(@vendor3)
    end

    it '#sorted_item_list' do
      expect(@market.sorted_item_list).to eq(["Banana Nice Cream", "Peach", "Peach-Raspberry Nice Cream", "Tomato"])
    end


    xit '#total_inventory' do
      expect(@market.total_inventory).to eq ({})
    end

  end
end

require './lib/exhibit'
require './lib/patron'
require './lib/museum'

RSpec.describe Museum do
  describe '#initialize' do
    it 'has one argument' do
      dmns = Museum.new("Denver Museum of Nature and Science")

      expect(dmns).to be_a(Museum)
    end

    it 'has two attributes, @name and @exhibits' do
    dmns = Museum.new("Denver Museum of Nature and Science")
    
    expect(dmns.name).to eq("Denver Museum of Nature and Science")
    expect(dmns.exhibits).to eq([])
    end

    it 'has @patrons that is an empty array' do
      dmns = Museum.new("Denver Museum of Nature and Science")

      expect(dmns).to be_a(Museum)
    end
  end

  describe '#add_exhibits' do
    it 'can add exhibits to @exhibits' do
      dmns = Museum.new("Denver Museum of Nature and Science")
      gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
      dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
      imax = Exhibit.new({name: "IMAX",cost: 15})

      dmns.add_exhibits(gems_and_minerals)

      expect(dmns.exhibits).to be_a(Array)

      dmns.add_exhibits(dead_sea_scrolls)
      dmns.add_exhibits(imax)

      dmns.exhibits.each do |exhibit|
        expect(exhibit).to be_a(Exhibit)
      end
    end
  end

    describe '#recommend_exhibits' do
      it 'can check a Patrons interests and recommend an exhibit' do
        dmns = Museum.new("Denver Museum of Nature and Science")
        gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
        dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
        imax = Exhibit.new({name: "IMAX",cost: 15})
        patron_1 = Patron.new("Bob", 20)
        patron_1.add_interest("Dead Sea Scrolls")
        patron_1.add_interest("Gems and Minerals")
        patron_2 = Patron.new("Sally", 20)
        patron_2.add_interest("IMAX")

        expect(dmns.recommend_exhibits(patron_1)).to be_a(Array)
        expect(dmns.recommend_exhibits(patron_1).count).to eq(2)

        exhibit_names = []
        dmns.recommend_exhibits(patron_1).each do |exhibit| 
          exhibit_names << exhibit
        end

        expect(exhibit_names).to eq(["Dead Sea Scrolls", "Gems and Minerals"])
      end
    end

    describe '#patrons_by_exhibit_interest' do

    dmns = Museum.new("Denver Museum of Nature and Science")
    gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    imax = Exhibit.new({name: "IMAX",cost: 15})
    dmns.add_exhibits(gems_and_minerals)
    dmns.add_exhibits(dead_sea_scrolls)
    dmns.add_exhibits(imax)
    patron_1 = Patron.new("Bob", 20)
    patron_1.add_interest("Dead Sea Scrolls")
    patron_1.add_interest("Gems and Minerals")
    patron_2 = Patron.new("Sally", 20)
    patron_2.add_interest("IMAX")
    dmns.recommend_exhibits(patron_1)
    dmns.recommend_exhibits(patron_2)

      it 'takes no argument and returns a Hash where each key is an exhibit' do
        
        expect(dmns.patrons_by_exhibit_interest).to be_a Hash
        expect(dmns.patrons_by_exhibit_interest.keys).to be_a Array
        expect(dmns.patrons_by_exhibit_interest.keys.first).to be_a Exhibit

      end

      it 'has a value that is an Array of all Patrons that have an interest in the exhibit' do

        expect(dmns.patrons_by_exhibit_interest.values).to be_a Array
        expect(dmns.patrons_by_exhibit_interest.values.first).to be_a Patron
      end
    end

    describe '#ticket_lottery_contestants' do

    dmns = Museum.new("Denver Museum of Nature and Science")
    gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
    dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
    imax = Exhibit.new({name: "IMAX",cost: 15})
    dmns.add_exhibits(gems_and_minerals)
    dmns.add_exhibits(dead_sea_scrolls)
    dmns.add_exhibits(imax)
    patron_1 = Patron.new("Bob", 20)
    patron_1.add_interest("Dead Sea Scrolls")
    patron_1.add_interest("Gems and Minerals")
    patron_2 = Patron.new("Sally", 20)
    patron_2.add_interest("IMAX")
    dmns.recommend_exhibits(patron_1)
    dmns.recommend_exhibits(patron_2)

      it 'returns an array of patrons that do not have enough money to see an exhibit but are interested in an exhibit' do

        expect(dmns.ticket_lottery_contestants).to be_a Array
        expect(dmns.ticket_lottery_contestants.first).to be_a Patron
        expect(dmns.ticket_lottery_contestants.first.name).to eq([])

        patron_3 = Patron.new("Erin", 0)
        patron_3.add_interest("Gems and Minerals")

        expect(dmns.ticket_lottery_contestants.first.name).to eq(["Erin"])
      end
    end

    describe '#draw_lottery_winner' do
      it 'generates a random winner from #ticket_lottery_contestants' do

      end
    end
end
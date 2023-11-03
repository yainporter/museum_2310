class Museum
  attr_reader :name, :exhibits

  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibits(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    @patrons << patron
    patron.interests.select{|interest| @exhibits.each{|exhibit| exhibit == interest}}
  end

  def patrons_by_exhibit_interest
    patrons_by_exhibit_interest = Hash.new
    
    @exhibits.each do |exhibit|
      @patrons.uniq.each do |patron|
        if recommend_exhibits(patron).include?(exhibit.name)
          patrons_by_exhibit_interest.store(exhibit, patron)
        end
      end
    end
    patrons_by_exhibit_interest
  end

  def exhibit_interests

  end
end
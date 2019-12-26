class ApplicationController < ActionController::Base
 
  def index
    country = Country.new
    if Country.all.size == 0
      CS.countries.each do |country|
        next if Country.exists?(name: country.second, slug: country.first)
        cty = Country.create(name: country.second, slug: country.first)
        cities = CS.get(country.first)
        if cities.size != 0
          cities.each do |city|
            next if City.exists?(name: city.second, slug: city.first)
            City.create!(name: city.second, slug: city.second.parameterize, country_id: cty.id)
          end
        end
      end
    end
  end

  def cities
    @cities = CS.get(params[:country])
  end

  def display_greetings
    country = Country.find_by(slug: params[:country])
    city = country.cities.find_by(slug: params[:city].parameterize)
    @greetings = "Hello from #{country.try(:name)}, #{city.try(:name)}"
  end

end

require 'csv'

class CityImporter
  attr_reader :filename,
              :cities,
              :number_of_lines

  def initialize(filename)
    @filename = filename
    @cities = []
    @number_of_lines = `wc -l #{filename}`
  end

  def import
    bar = ProgressBar.create(title: "Cities", :total => number_of_lines.to_i)

    City.transaction do
      CSV.foreach(filename, headers: true) do |row|
        City.create(name: row['city'])

        bar.increment
      end
      bar.finish
    end
  end

end

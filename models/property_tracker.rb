class PropertyTracker
    attr_accessor :address, :value, :number_of_bedrooms, :year_built
    attr_reader :id
    
    def initialize (options)
        @id = options['id'].to_i()
        @address = options['address']
        @value = options['value'].to_i()
        @number_of_bedrooms = options['number_of_bedrooms'].to_i()
        @year_built = options['year_built'].to_i()
    end

    











    
end
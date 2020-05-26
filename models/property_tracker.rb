require('pg')

class PropertyTracker
    attr_accessor :address, :value, :number_of_bedrooms, :year_built
    attr_reader :id
    
    def initialize (options)
        @id = options['id'].to_i() if options['id']
        @address = options['address']
        @value = options['value'].to_i()
        @number_of_bedrooms = options['number_of_bedrooms'].to_i()
        @year_built = options['year_built'].to_i()
    end

    def save()
        db = PG.connect( { dbname: 'property_listings', host: 'localhost' } )
        sql = "INSERT INTO property_tracker
            (address,
            value,
            number_of_bedrooms,
            year_built)
            VALUES
            ($1, $2, $3, $4)
            RETURNING *;"
            values = [@address, @value, @number_of_bedrooms, @year_built]
            db.prepare("save", sql)
            @id = db.exec_prepared("save", values)[0]["id"].to_i()
            db.close()
    end

    def update()
        db = PG.connect( { dbname: 'property_listings', host: 'localhost' } )
        sql = "UPDATE property_tracker
            SET
            (address,
            value,
            number_of_bedrooms,
            year_built)
            =
            ($1, $2, $3, $4)
            WHERE id = $5;"
            values = [@address, @value, @number_of_bedrooms, @year_built, @id]
            db.prepare("update", sql)
            db.exec_prepared("update", values)
            db.close()
    end

    def delete()
        db = PG.connect({dbname: 'property_listings', host: 'localhost'})
        sql = "DELETE FROM property_tracker WHERE id = $1;"
        id = [@id]
        db.prepare("delete", sql)
        db.exec_prepared("delete", id)
        db.close()
    end

    def PropertyTracker.find_by_id(id_number)
        db = PG.connect({dbname: 'property_listings', host: 'localhost'})
        sql = "SELECT * FROM property_tracker WHERE id = $1;"
        values = [id_number]
        db.prepare("all", sql)
        found_properties = db.exec_prepared("all", values)
        db.close()
        return nil if found_properties.first() == nil
        property_as_hash = found_properties[0]
        found_property = PropertyTracker.new(property_as_hash)
        return found_property
    end

    def PropertyTracker.all()
        db = PG.connect({dbname: 'property_listings', host: 'localhost'})
        sql = "SELECT * FROM property_tracker;"
        db.prepare("all", sql)
        all_properties = db.exec_prepared("all")
        db.close()
        all_properties_as_objects = all_properties.map { |property| PropertyTracker.new(property)}
        return all_properties_as_objects     
    end












    
end
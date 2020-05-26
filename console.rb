require('pry')
require_relative('models/property_tracker')

property1 = PropertyTracker.new({
    'address' => 'EH5 3NJ',
    'value' => 100,
    'number_of_bedrooms' => 1,
    'year_built' => 1890
})

property2 = PropertyTracker.new({
    'address' => 'EH8 9NA',
    'value' => 230,
    'number_of_bedrooms' => 4,
    'year_built' => '1910' 
})



binding.pry

nil
local patterns = require('nrpattern.default')

patterns[{"yes", "no"}] = {priority = 5}
patterns[{"one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve"}] = {priority = 3}

require('nrpattern').setup()

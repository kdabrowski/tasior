# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

entries_raw = [
{ "latitude": 32.9377784729004, "longitude": -117.230392456055},
{ "latitude": 32.937801361084, "longitude": -117.230323791504},
{ "latitude": 32.9378204345703, "longitude": -117.230278015137},
{ "latitude": 32.9378204345703, "longitude": -117.230239868164},
{ "latitude": 32.9378318786621, "longitude": -117.230209350586},
{ "latitude": 32.9378814697266, "longitude": -117.230102539062},
{ "latitude": 32.9378890991211, "longitude": -117.230072021484},
{ "latitude": 32.9379081726074, "longitude": -117.230018615723},
{ "latitude": 32.9379005432129, "longitude": -117.22998046875},
{ "latitude": 32.937931060791, "longitude": -117.229949951172},
{ "latitude": 32.9379615783691, "longitude": -117.229919433594}
]

Trace.create(geo: entries_raw)

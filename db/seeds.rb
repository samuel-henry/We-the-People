# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
hello_speech = Speech.create
hello_speech.date = "3/10/13"
hello_speech.location = "Chicago, IL"
hello_speech.speaker = "Samuel Henry"
hello_speech.title = "Hello World"
hello_speech.text = ["Hello","World","to","Samuel","Henry"]
hello_speech.save


ray_speech = Speech.create
ray_speech.date = "12/12/99"
ray_speech.location = "Pittsburgh, PA"
ray_speech.speaker = "Ray Lewis"
ray_speech.title = "Pre-Game Speech"
ray_speech.text = ["We","will","totally","win"]
ray_speech.save



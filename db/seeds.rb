# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
files = []
100.times do |j|
  files << GenericWork.new do |work|
    work.title = ["Jack's Research"]
    work.keyword = ['jacks_keyword']
    work.apply_depositor_metadata('tricia.jenkins@ualberta.ca')
    work.read_groups = ['public']
    work.save!
  end
end

430.times do |i|
  Collection.new(title: ["Collection #{i}"]).tap do |c|
    c.apply_depositor_metadata "tricia.jenkins@ualberta.ca"
    c.members << files.sample(rand(10...100))
    c.save!
  end
end

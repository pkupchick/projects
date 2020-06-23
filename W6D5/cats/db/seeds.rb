# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ActiveRecord::Base.transaction do
    Cat.destroy_all

    bob = Cat.create!(birth_date: "2001-02-03", color: "Orange", name: "bob", sex: "M", description: "He loves balls of yarn and gently belly rubs")

    sam = Cat.create!(birth_date: "2010-06-19", color: "Black", name: "sam", sex: "M", description: "Sam likes to be read to before bed")

    jill = Cat.create!(birth_date: '2018-04-08', color: "Brown", name: "jill", sex: "F", description: "She loves balls of yarn and warm milk")

end
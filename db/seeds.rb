# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
require 'csv'

csv_text = Rails.root.join('lib', 'seeds', 'vocapp_test_csv.csv')
fields = []
terms = []

# Runs through each row and stores field and term+field data in arrays
CSV.foreach(csv_text, headers: true) do |row|
  fields << row[2].capitalize
  terms << [row[0].downcase, row[2].capitalize, row[5], row[4], row[6], row[7]]
end

# Creates a user so the DB has a user_id of 1
user = User.create!(email:"p@p.com", password:"password")
user.id = 1
user.save!

# Creates an admin user
superUser = User.create!(email: "admin@gmail.com", password: "password")
superUser.admin = true
superUser.save!

# Creates an academic user
academic_user = User.create!(email: 'academic@vocapp.com', password: 'password')
academic_user.academic = true
academic_user.save!
# Creates each non-duplicate field in DB
fields.uniq.each { |f| Field.create!(name: f) }

# Assigns the correct field_id to each term, plus user_id of 1
# Creates answers for each term
print terms
terms.each.with_index do |t, i|
  field_id = Field.where(name: t[1])[0].id
  term = Term.create(term_en: t[0], user_id: 1, field_id: field_id)
  term_identity = term.id
  Answer.create(definition_ar: t[2], definition_en: t[3], context_en: t[4], context_ar: t[5], user_id: 1, term_id: term_identity)
end

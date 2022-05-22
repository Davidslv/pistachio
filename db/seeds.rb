# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Admin::AllowedArea.create(area: 'Southwark')
Admin::AllowedArea.create(area: 'Lambeth')

Admin::AllowedPostcode.create(postcode: 'SH241AA')
Admin::AllowedPostcode.create(postcode: 'SH241AB')

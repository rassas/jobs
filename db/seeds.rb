# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Weapon.create([
  {
    name: 'AK-47',
    attack_points: 20,
    required_experience: 0
  },
  {
    name: 'M16 rifle',
    attack_points: 18,
    required_experience: 0
  },
  {
    name: 'MG42',
    attack_points: 13,
    required_experience: 0
  },
  {
    name: 'Shutgun',
    attack_points: 15,
    required_experience: 0
  },
  {
    name: 'Bazooka',
    attack_points: 15,
    required_experience: 25
  }
])

Shield.create([
  {
    name: 'Helmet',
    defense_points: 25,
    required_experience: 0
  },
  {
    name: 'Kevlar Vest',
    defense_points: 75,
    required_experience: 0
  },
  {
    name: 'Tactical Shield',
    defense_points: 100,
    required_experience: 15
  }
])

Character.create([
  {
    name: "Jett",
    health_base_points: 90,
    attack_base_points: 75
  },
  {
    name: "Killjoy",
    health_base_points: 120,
    attack_base_points: 50
  },
  {
    name: "Sova",
    health_base_points: 100,
    attack_base_points: 55
  },
  {
    name: "Viper",
    health_base_points: 110,
    attack_base_points: 50
  },
  {
    name: "Phoenix",
    health_base_points: 100,
    attack_base_points: 70
  }
])

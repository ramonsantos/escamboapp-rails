# frozen_string_literal: true

namespace :dev do
  desc 'Setup Development'
  task setup: :environment do
    images_path = Rails.root.join('public', 'system')

    puts 'Executando o setup para desenvolvimento...'

    puts "APAGANDO BD... #{`rake db:drop`}"
    puts "Apagando imagens de public/system #{`rm -rf #{images_path}`}"
    puts "CRIANDO BD... #{`rake db:create`}"
    puts `rake db:migrate`
    puts `rake db:seed`
    puts `rake dev:generate_admins`
    puts `rake dev:generate_members`
    puts `rake dev:generate_ads`

    puts 'Setup completado com sucesso!'
  end

  #################################################################

  desc 'Cria Administradores Fake'
  task generate_admins: :environment do
    puts 'Cadastrando ADMINISTRADORES...'

    Admin.create!(
      name: 'Ramon Santos',
      email: 'ramonsantos.pe@gmail.com',
      password: '123456',
      password_confirmation: '123456',
      role: [0, 0, 1, 1, 1].sample
    )

    10.times do
      Admin.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: '123456',
        password_confirmation: '123456',
        role: [0, 0, 1, 1, 1].sample
      )
    end

    puts 'ADMINISTRADORES cadastrados com sucesso!'
  end

  #################################################################

  desc 'Cria Membros Fake'
  task generate_members: :environment do
    puts 'Cadastrando MEMBROS...'

    Member.create!(
      email: 'ramonsantos.pe@gmail.com',
      password: '123456',
      password_confirmation: '123456'
    )

    100.times do
      Member.create!(
        email: Faker::Internet.email,
        password: '123456',
        password_confirmation: '123456'
      )
    end

    puts 'MEMBROS cadastrados com sucesso!'
  end

  #################################################################

  desc 'Cria Anúncios Fake'
  task generate_ads: :environment do
    puts 'Cadastrando ANÚNCIOS...'

    5.times do
      Ad.create!(
        title: Faker::Lorem.sentence([2, 3, 4, 5].sample),
        description_md: markdown_fake,
        description_short: Faker::Lorem.sentence([2,3].sample),
        member: Member.first,
        category: Category.all.sample,
        price: "#{Random.rand(500)},#{Random.rand(99)}",
        finish_date: Date.today + Random.rand(90),
        picture: File.new(Rails.root.join('public', 'templates', 'images-for-ads', "#{Random.rand(9)}.jpg"), 'r')
      )
    end

    100.times do
      Ad.create!(
        title: Faker::Lorem.sentence([2, 3, 4, 5].sample),
        description_md: markdown_fake,
        description_short: Faker::Lorem.sentence([2,3].sample),
        member: Member.all.sample,
        category: Category.all.sample,
        price: "#{Random.rand(500)},#{Random.rand(99)}",
        finish_date: Date.today + Random.rand(90),
        picture: File.new(Rails.root.join('public', 'templates', 'images-for-ads', "#{Random.rand(9)}.jpg"), 'r')
      )
    end

    puts 'ANÚNCIOS cadastrados com sucesso!'
  end

  def markdown_fake
    %x(ruby -e "require 'doctor_ipsum'; puts DoctorIpsum::Markdown.entry")
  end
end

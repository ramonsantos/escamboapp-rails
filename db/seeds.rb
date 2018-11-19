categories = [
  'Animais e acessórios',
  'Esportes',
  'Para a sua casa',
  'Eletrônicos e celulares',
  'Música e hobbies',
  'Bebês e crianças',
  'Moda e beleza',
  'Veículos e barcos',
  'Imóveis',
  'Empregos e negócios'
]

categories.each do |category|
  Category.find_or_create_by!(description: category)
end

Admin.create!(
  name: 'Administrador Geral',
  email: 'admin@admin.com',
  password: '123456',
  password_confirmation: '123456',
  role: 0
)

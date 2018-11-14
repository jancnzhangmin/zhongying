# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.find_by_login('admin')
if user
  puts '管理员已存在！'
else
  User.create(login:'admin', name:'管理员', password:'admin', password_confirmation:'admin', wxauth:1, status:1)
  puts '管理员初始化成功'
end
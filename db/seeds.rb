# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
makanan = Category.find_or_create_by!(name: 'Makanan', enable: true)
minuman = Category.find_or_create_by!(name: 'Minuman', enable: true)
product = Product.find_or_create_by!({ name: 'Seblak Kacang Ijo', enable: true,
                                       description: 'Seblak dengan taburan kacang ijo' })

img1 = Rails.root.join('public', 'apple-touch-icon-precomposed.png')
img2 = Rails.root.join('public', 'apple-touch-icon.png')
img_1 = Image.create!(name: 'seblak-kacang-ijo-1', enable: true, file: img1.open)
img_2 = Image.create!(name: 'seblak-kacang-ijo-2', enable: true, file: img2.open)

ImageProduct.find_or_create_by!(products_id: product.id, images_id: img_1.id)
ImageProduct.find_or_create_by!(products_id: product.id, images_id: img_2.id)

CategoryProduct.find_or_create_by!(products_id: product.id, categories_id: makanan.id)
CategoryProduct.find_or_create_by!(products_id: product.id, categories_id: minuman.id)

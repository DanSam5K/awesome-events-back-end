# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

people = [
    { email: 'pedro@gmail.com', password: '123456' , password_confirmation: '123456', name: 'Pedro' },
    { email: 'maria@gmail.com', password: '123456' , password_confirmation: '123456', name: 'Maria' },
    { email: 'daniel@gmail.com', password: '123456' , password_confirmation: '123456', name: 'Daniel' },
    { email: 'enio@gmail.com', password: '123456' , password_confirmation: '123456', name: 'Enio' },
    { email: 'aristides@gmail.com', password: '123456' , password_confirmation: '123456', name: 'Aristides' },
    { email: 'jose@gmail.com', password: '123456' , password_confirmation: '123456', name: 'Jose' }
]

cities = ['Manaus', 'Rio de Janeiro', 'Caracas', 'Lagos', 'Abuja', 'New York']

countries = ['Brasil', 'Brasil', 'Venezuela', 'Nigeria', 'Nigeria', 'USA']

descriptions = ['Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras velit tellus, rutrum sagittis mattis vitae, euismod sit amet mi.
Vestibulum hendrerit mauris nunc, eu maximus purus molestie vitae.
Integer nisl turpis, lobortis vitae nisi ut, viverra tincidunt erat.
Praesent sit amet leo et nisl condimentum cursus. Nulla iaculis, dolor eget suscipit mollis, mi libero euismod tellus, eu iaculis odio risus sed nisl.
Vivamus pretium arcu eu eros feugiat ultricies. Morbi in scelerisque mauris, non viverra dui. Nunc a hendrerit metus, in tincidunt mi.
Vivamus dapibus posuere augue in interdum. Nullam facilisis nulla dui, ac ultricies sem ultricies at. Donec congue cursus purus et hendrerits',
'Quisque in felis sit amet augue accumsan euismod viverra ac tellus.
Curabitur in congue risus, luctus vestibulum tellus. Nulla gravida erat metus, vitae tempus dolor sodales tincidunt.
Sed gravida condimentum leo lacinia tempus. Duis sit amet mauris quis purus sodales sagittis vitae sed sapien.
Aenean porttitor at est at mollis. Nunc eu sodales odio. Morbi nibh nisi, rhoncus sed tincidunt ac, molestie et libero.',
'Pellentesque quis gravida quam, rutrum rutrum mauris. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.
Praesent venenatis malesuada turpis quis fermentum. Phasellus viverra consequat sem, nec iaculis est semper eu. Ut quis placerat lorem.
Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi semper libero quam, sit amet dapibus sapien dapibus a.',
'In lobortis ut magna eget congue. Aenean sed risus lectus. Praesent in lobortis turpis. Etiam pretium feugiat leo, et interdum ante.
Suspendisse tortor diam, congue vel nunc a, dictum laoreet elit.
Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aliquam erat volutpat.
Integer faucibus sapien sed dolor bibendum, at mollis ipsum tempor. Morbi pulvinar fermentum eros eget blandit.
Duis ante orci, congue a augue sit amet, luctus luctus ipsum. Donec tempor nisl a ullamcorper iaculis.',
'Sed non augue non diam tincidunt dictum. Phasellus molestie facilisis diam, id tincidunt elit consectetur a. Nulla facilisi.
Etiam malesuada nulla a aliquet molestie. Donec vitae arcu convallis, finibus ante in, ultricies ante. Fusce feugiat hendrerit quam at sodales.
Etiam dapibus accumsan purus ac malesuada. Vestibulum bibendum tortor lectus, sed vestibulum orci semper at. Nulla facilisi.
Nam condimentum felis mollis accumsan placerat. Ut quis eros at lectus tempus vulputate nec nec est. Aliquam eu egestas risus.
Vivamus egestas sollicitudin ex. Vivamus scelerisque tellus sit amet justo ultricies ornare.
Nam velit ante, varius sed ullamcorper at, mollis quis leo.',
'Suspendisse felis dui, luctus ut dictum eget, vestibulum vel orci. Morbi tempor laoreet massa accumsan cursus.
Sed ultricies nisi aliquam, molestie diam congue, rhoncus enim.
Sed aliquet, enim quis volutpat rutrum, ipsum erat dictum lorem, id commodo purus enim vitae mi.
Sed dolor odio, sodales vel odio nec, finibus lobortis tellus. Suspendisse potenti. Pellentesque semper fringilla venenatis.
Mauris interdum laoreet rhoncus. Duis id nulla sed lectus rhoncus aliquam. Ut id viverra turpis. Etiam non placerat orci, id facilisis turpis.']

names = ['movie', 'concert', 'party', 'beach', 'travel', 'restaurant']

User.create(people)

User.all.each_with_index do |user, i|
  user.events.create(name: names[i], description: descriptions[i], city: cities[i], country: countries[i], date_of_event: Date.today + 20 + i, attendees_count: 0)
end

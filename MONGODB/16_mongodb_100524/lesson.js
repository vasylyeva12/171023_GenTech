// 1. Выбрать БД

// use group_171023

// 2. Создать коллекцию goods, используя массив
db.goods.insertMany(

[  
  {
    _id: 1,
    title: "Велосипед",
    price: 45000,
    count: 12,
    country: 'Germany'
  },
  {
    _id: 2,
    title: "Самокат",
    price: 15000,
    count: 10,
    country: 'Spain'
  },
  {
    _id: 3,
    title: "Ролики",
    price: 20000,
    count: 20,
    country: 'Germany'
  },
  {
    _id: 4,
    title: "Лыжи",
    price: 22000,
    count: 15,
    country: 'France'
  },
  {
    _id: 5,
    title: "Скейт",
    price: 19000,
    count: 4,
    country: 'Spain'
  },
  {
    _id: 6,
    title: "Сноуборд",
    price: 33000,
    count: 17,
    country: 'Germany'
  }
])
// 3. Проверить содержимое коллекции

db.goods.find()

// 4. Вывести товары, количество которых меньше 10

db.goods.find( { 
    $and: [
        {count: {$lt: 10}}
        
    ]      
})

db.goods.find( { count: {$lt: 10} })

// 5. Вывести товары с айди 2, 4, 5

db.goods.find( { _id:{$in:[2,4,5]} })   

db.goods.find({
    $or: [
      {_id: 2},
      {_id: 4},
      {_id: 5}
    ]
  })

  // 6. Вывести (Извлечь) данные из коллекции о продуктах Скейт, Сноуборд, Лыжи, если их цена больше 20000
  db.goods.find( { 
    $and: [
        {title: {$in:['Скейт', 'Сноуборд', 'Лыжи']}},
        {price: {$gt: 20000}}
        
    ]      
})

db.goods.find( { 
    
        title: {$in:['Скейт', 'Сноуборд', 'Лыжи']},
        price: {$gt: 20000}       
         
})

// 7. Переименовать коллекцию из goods в products

db.goods.renameCollection('products')

// 8. Вывести продукты, цена которых от 10000 до 20000 (вкл)

db.products.find({price: {$gte: 10000, $lte: 20000}})

// 9. Вывести товары из Германии и Франции дороже 25000

db.products.find( { 
    
  country: {$in:['Germany', 'France']},
  price: {$gt: 25000}       
   
})

// длинный вариант
db.products.find({
  $and: [
    {country: {$in: ['Germany', 'France']}},
    {price: {$gt: 20000}}
  ]
})

// 10. Найти товары из Германии, цена которых от 10 до 20 тыс (вкл) и кол-во которых от 10 до 35 (вкл)

db.products.find( { 
    
  count: {$gte: 10, $lte: 35},
  price: {$gte: 10000, $lte: 20000},      
  country: 'Germany' 
})








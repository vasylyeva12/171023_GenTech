// use - команда для создания БД или для того чтоб переключиться между бд

db.createCollection('user')

// cls - Очищает скрипт/консоль

// show databases - Показывает все бд

// show collections - Показывает коллекции

db.user.insertOne({
    name: 'John',
    lastName: 'Smith',
    age: 18,
    address: {
            building: 1,
            street: 'Burbank 12/34'
        }
    })

// db.user.insertOne() - Вставляет один объект в коллекцию

db.user.insertOne({
    name: 'John',
    lastName: 'Smith',
    age: 18,
    address: {
            building: 1,
            street: 'Burbank 12/34'
        }
    })


// db.user.insertMany - Вставляет несколько объектов в коллекцию. Добавляем через массив из объектов.
db.user.insertMany([
    {
      name: 'Bob',
      lastName: 'Brown',
      age: 20,
      adress: {
          build: 2,
          srteet: 'Burbank 12/35'}
  },
    {
      name: 'Lily',
      lastName: 'Smith',
      age: 18,
      address: {
          building: 1	}	
      },
      {
  name: 'Alona',
  lastName: 'Sima',
  age: 28,
  address: {
          building: 1	}	
      }
  ])

  // Создать коллекцию fruits и заполнить документами со следующими свойствами: 
// _id, title, price, count. Используйте следующие данные:
    
// 1 Apple 280 4
// 2 Lemon 300 8
// 3 Lime 500 3
// 4 Orange 200 8

db.fruits.insertMany([
    {
          _id: 1,
          title: 'Apple',
          price: 280,
          count: 4
      },
    {
          _id: 2,
          title: 'Lemon',
          price: 300,
          count: 8
  },
  {
          _id: 3,
          title: 'Lime',
          price: 500,
          count: 3
  },
  {
          _id: 4,
          title: 'Orange',
          price: 200,
          count: 8
  }
  ])

  // db.users.deleteOne({Условие}) - удалит первую запись соответсувующий запросу
  db.user.deleteOne({name: 'Bob'})

//   {
//     acknowledged: true,
//     deletedCount: 1
//   }

// db.users.deleteMany({Условие}) - удалит все записи соответсувующие запросу
db.user.deleteMany({lastName: 'Smith'})

// {
//     acknowledged: true,
//     deletedCount: 2
//   }

// Удаляет колекцию
db.user.drop()

// Удаляем БД
db.dropDatabase()




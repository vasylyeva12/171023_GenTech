// ОПЕРАТОРЫ СРАВНЕНИЯ

// $eq - =
// $ne - !=
// $lt - <
// $lte - <=
// $gt - >
// $gte - >=
// $in - значение соответствует одному из []
//$nin - никакое из условие не выполняется

// ЛОГИЧЕСКИЕ ОПЕРАТОРЫ
// $and - И
// $or - ИЛИ
// $not - НЕ
// $nor - никакое из условие не выполняется

// 1. Выбрать БД

//use group_171023

// 2. Удалить коллекцию users

// 3. Создать новую пустую коллекцию users

/*
  4. Заполнить коллекцию документами (4 штуки) со следующими 
  свойствами (_id, name, age, gender). Используйте следующие данные
  
1 Anatoliy 28 m
2 Svetlana 25 f
3 Nikita 33 m
4 Olga 22 f

*/

// 5. Проверить содержимое коллекции users

[
    {
          _id: 1,
          name: 'Anatoliy',
          age: 28,
          gender: m
      },
    {
          _id: 2,
          name: 'Svetlan',
          age: 25,
          gender: f
  },
  {
          _id: 3,
          name: 'Nikita',
          age: 33,
          cgender: m
  },
  {
          _id: 4,
          name: 'Olga',
          age: 22,
          gender: f
  }
  ]

  // 6. Вывести всех пользователей, чей возраст равен 33

db.users.find({ age: 33 })

db.users.find( { age: {$eq: 33} } )

db.users.find( { 
    $and: [
        {age: {$gte: 25} },
        {name: 'Nikita'}

    ]
})

db.users.find( { 
    age: {$gte: 20, $lte: 30}
    
})

// 14. Вывести всех женщин старше 23 (вкл)

db.users.find( { 
    $and: [
        {age: {$gt: 23}},
        {gender: 'f'}
    ]      
})

// 15. Вывести всех мужчин в возрасте от 15 до 30 лет (вкл)

db.users.find( { 
    $and: [
        {age: {$gte: 15, $lte:30}},
        {gender: 'm'}
    ]      
})


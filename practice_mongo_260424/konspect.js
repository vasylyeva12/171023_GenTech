// Пример коллекции
// Коллекция = таблица в sql
[
    {
      _id: 1,
      firstname: 'Nelli',
      age: 30
    },
    {
      _id: 2,
      firstname: 'Anton',
      age: 35
    },
    {
      _id: 3,
      firstname: 'Olga',
      age: 32
    }
  ]
  
  
  // Пример документа
  // Документ = запись/строка в sql
  // Свойство/ключ = поле в sql
//   {
//     _id: 1,
//     firstname: 'Nelli',
//     age: 23,
//     online: true,
//     score: undefined,
//     address: {
//       city: 'Yerevan',
//       country: 'Armenia'
//     },
//     languages: ['Russian', 'English', 'Armenian']
//   }

// Добавить один документ в коллекцию
// db.users.insertOne({
//     _id: 1,
//     firstname: 'Anton',
//     age: 23
//   })
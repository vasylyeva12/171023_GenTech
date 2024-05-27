db.profiles.insertMany(
    [  
        {
          _id: 1,
          firstname: "Ivan",
          lastname: 'Petrov',
          age: 28,
          gender: 'male',
          position: 'Product manager',
          salary: 5000,
          country: 'Germany',
          city: 'Berlin'
        },
        {
          _id: 2,
          firstname: "Svetlana",
          lastname: 'Ivanova',
          age: 38,
          gender: 'female',
          position: 'Designer',
          salary: 2000,
          country: 'Germany',
          city: 'Bremen'
        },
        {
          _id: 3,
          firstname: "Olga",
          lastname: 'Sidorova',
          age: 28,
          gender: 'female',
          position: 'PR manager',
          salary: 4500,
          country: 'Germany',
          city: 'Dresden'
        },
        {
            _id: 4,
            firstname: "Ivan",
            lastname: 'Petrov',
            age: 56,
            gender: 'male',
            position: 'Product manager',
            salary: 5700,
            country: 'Germany',
            city: 'Berlin'
          },
          {
            _id: 5,
            firstname: "Semen",
            lastname: 'Petrov',
            age: 28,
            gender: 'male',
            position: 'Product manager',
            salary: 4000,
            country: 'France',
            city: 'Paris'
          },
          {
            _id: 6,
            firstname: "Olga",
            lastname: 'Petrova',
            age: 27,
            gender: 'female',
            position: 'Product manager',
            salary: 8000,
            country: 'Spain',
            city: 'Madrid'
          },
          {
            _id: 7,
            firstname: "Ivan",
            lastname: 'Ushanov',
            age: 34,
            gender: 'male',
            position: 'Product manager',
            salary: 5100,
            country: 'Germany',
            city: 'Berlin'
          },
        ]

)


    // 3. Проверить содержимое коллекции

    db.profiles.find()

    // 4. Вывести документы отсортированными в порядке убывания зарплаты

    db.profiles.find().sort({salary: -1})

    // 5. Вывести документы, отсортированными по возрасту в порядке возрастания

    db.profiles.find().sort({age: 1})

    // 6. Вывести документ с данными о профайле, который зарабатывает меньше всего

    db.profiles.find().sort({salary: 1}).limit(1)

    // 8. Вывести самый взрослый профайл (имя, фамилия, возраст)

    db.profiles.find({},{firstname: 1, lastname: 1, age: 1}).sort({age: -1}).limit(1)

    // 9. Вывести имена, фамилии и зарплаты тех, кто зарабатывает больше 5000 (вкл)

    db.profiles.find(
        { salary: { $gte: 5000 } }, 
        { _id: 0, firstname: 1, lastname: 1, salary: 1 }
      )
// 10. Вывести имена, фамилии и зарплаты тех, кто зарабатывает больше 5000 (вкл), отсортированными в порядке возрастания зарплаты
      

    db.profiles.find({salary:{$gte: 5000}},{_id: 0, firstname: 1, lastname: 1, salary: 1}).sort({salary: 1})

    // 11. Вывести имена, фамилии, возраст тех, чей возраст от 20 до 50 (вкл) и кто из Germany, отсортированными в порядке возрастания возраста

    db.profiles.find({
        age:{$gte: 20, $lte:50 }, 
        country: 'Germany'
    },
    {_id: 0, firstname: 1, lastname: 1, age: 1}
    ).sort({age: 1})


    // 12. Вывести все профайлы с фамилией Petrov в возрасте от 20 до 40 (вкл). Вывести все свойства, кроме position
    
    db.profiles.find({
        age:{$gte: 20, $lte:40 }, 
        lastname: 'Petrov'
    },
    {position: 0}
    )
    
   
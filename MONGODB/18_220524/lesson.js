db.workers.find({age: {$gt: 30}}, {firstname: 1, lastname: 1})
db.workers.find({age: {$gt: 30}}, {firstname: 1, lastname: 1, _id: 0})


// Вывести только имена и фамилии работников, которым больше 30.
// Выводим _id, firstname, lastname
db.workers.find({age: {$gt: 30}}, {firstname: 1, lastname: 1})
// Выводим только firstname, lastname
db.workers.find({age: {$gt: 30}}, {firstname: 1, lastname: 1, _id: 0})

//Вывести только имена и фамилии работников
db.workers.find({}, {firstname: 1, lastname: 1, _id: 0})

// Вывести все поля кроме id и salary
db.workers.find({}, {_id: 0, salary: 0})

//Найти всех работников, чья зарплата меньше 3000 или возраст больше 40. Вывести все поля, кроме зарплаты

db.workers.find(
    {$or: [
        {salary: {$lt: 3000}},
        {age: {$gt: 40}}
    ]},
    {salary: 0})

//  Найти всех работников, чья зарплата больше 2000 и возраст больше 20. Вывести только имя, фамилию и зарплату, без _id.

db.workers.find({salary: {$gt: 2000}, age: {$gt: 20}}, {firstname: 1, lastname: 1, salary: 1, _id: 0})


// Пагинации
// limit(кол/во строк)
// skip(кол/во строк которое нужно пропустить)
db.collection_name.find().limit()
db.collection_name.find().skip()
db.collection_name.find().skip().limit()
db.collection_name.find().limit().skip()

// Вывести первого работника
db.workers.find().limit(1)

// Вывести всех работников пропуская первых двух

db.workers.find().skip(2)

// Вывести двух работников пропуская первого (2, 3)

db.workers.find().limit(2).skip(1)

//Найти сотрудников, которые зарабатывают больше 2000, вывести только первых двух.

db.workers.find({salary: {$gt: 2000}}).limit(2)

// Сортировка
// sort({column: 1(по возр.)/-1(по убыв.)})

// Вывести всех сотрудников и сортировать их по возрасту по убыванию
db.workers.find().sort({age: -1})

// Вывести всех сотрудников и сортировать их по возрасту по убыванию
db.workers.find().sort({age: -1})

// Вывести самого молодого работника
db.workers.find().sort({age: 1}).limit(1)



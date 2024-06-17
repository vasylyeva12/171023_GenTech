// 2. Создать коллекцию courses со свойствами id, title, students_count, weeks, points, university_title используя следующие данные:

db.courses.insertMany([
    {
      _id: 1,
      title: "International Relations",
      students_count: 7,
      weeks: 10,
      ponts: 10,
      university_title: "Harvard",
    },
    {
      _id: 2,
      title: "Political Science",
      students_count: 8,
      weeks: 9,
      ponts: 10,
      university_title: "Yale",
    },
    {
      _id: 3,
      title: "Economy",
      students_count: 3,
      weeks: 6,
      ponts: 12,
      university_title: "Brown",
    },
    {
      _id: 4,
      title: "International Relations",
      students_count: 5,
      weeks: 5,
      ponts: 13,
      university_title: "Yale",
    },
    {
      _id: 5,
      title: "Economy",
      students_count: 6,
      weeks: 8,
      ponts: 9,
      university_title: "Yale",
    },
    {
      _id: 6,
      title: "German literature",
      students_count: 3,
      weeks: 7,
      ponts: 10,
      university_title: "Harvard",
    },
    {
      _id: 7,
      title: "Economy",
      students_count: 15,
      weeks: 20,
      ponts: 15,
      university_title: "Harvard",
    }
  ])

  // 3. Проверить содержимое коллекции courses

db.courses.find()

// 4. Найти сколько курсов есть в коллекции

db.courses.find('title').count()

// 5. Сколько курсов предлагают университеты Harvard и Yale в сумме (6)


db.courses.find({ university_title: {$in: ['Harvard', 'Yale']} }).count()

db.courses.countDocuments({ university_title: {$in: ['Harvard', 'Yale']} })

// 6. Переименовать свойство ponts в points

db.courses.updateMany(
    {},
    {$rename: {'ponts': 'points'}}
  )

  // 7. Сколько баллов можно набрать в сумме, посетив все курсы университета Yale (32)
// {
//     _id: 'Yale',
//     total_points: 32
//   }

db.courses.aggregate(
    {$match: {university_title: 'Yale'}},
    {$group: {_id: '$university_title', total_points: {$sum: '$points'}}}
  )

  // 8. Сколько всего недель займет прохождение курсов в Yale и Brown (в разбивке по универам)

// {
//     _id: 'Yale',
//     total_weeks: 22
//   }
//   {
//     _id: 'Brown',
//     total_weeks: 6
//   }
  
  db.courses.aggregate(
    {$match: {university_title: {$in: ['Yale', 'Brown']}}},
    {$group: {_id: '$university_title', total_weeks: {$sum: '$weeks'}}}
  )

  // 9. Сколько всего недель займет прохождение курсов в Yale и Brown (без разбивки по универам)

// {
//     _id: 'Yale_and_Brown',
//     total_weeks: 28
//   }
  
  db.courses.aggregate(
    {$match: {university_title: {$in: ['Yale', 'Brown']}}},
    {$group: {_id: 'Yale_and_Brown', total_weeks: {$sum: '$weeks'}}}
  )

  // 10. Сколько всего недель займет прохождение курсов в Yale и Brown (в разбивке по универам). Вывести группы отсортированными по итоговой сумме недель по возрастанию

db.courses.aggregate(
    {$match: {university_title: {$in: ['Yale', 'Brown']}}},
    {$group: {_id: '$university_title', total_weeks: {$sum: '$weeks'}}}
  ).sort({ total_weeks: 1 })
  
  db.courses.aggregate(
    {$match: {university_title: {$in: ['Yale', 'Brown']}}},
    {$group: {_id: '$university_title', total_weeks: {$sum: '$weeks'}}},
    {$sort: {total_weeks: 1}}
  )
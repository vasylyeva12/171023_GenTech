// 2. Пользователю с id 3 измените свойство city на пустой массив
db.profiles.updateOne(
    {_id: 3},
    {$set:{city: []}}
)

// 3. Пользователям с именами Olga и Semen измените свойство city на массив и добавьте в него города Madrid, Barcelona, Valencia.

db.profiles.updateMany(
    {firstname: {$in:['Olga','Semen']}},
    {$set:{city:[] }}
)

db.profiles.updateMany(
    {firstname: {$in:['Olga','Semen']}},
    {$set:{city: {$each:[['Madrid', 'Barcelona', 'Valencia']]}}}
)

db.profiles.updateMany(
    {firstname: {$in: ['Olga', 'Semen']}},
    {$set: {city: ['Madrid', 'Barcelona', 'Valencia']}}
  )

  // 4. Всем документам добавьте свойство status со значением ‘not defined’
  db.profiles.updateMany(
    {},
    {$set: {status: 'not defined'}}
  )

  // 5. Всем людям старше 30 (вкл. 30) обновить свойство status на ‘older than 30’
  db.profiles.updateMany(
    {age: {$gt: 30}},
    {$set: {status: 'older than 30'}}
  )
// 6. Всем людям младше 30 обновить свойство status на ‘younger than 30’
db.profiles.updateMany(
    {age: {$lt: 30}},
    {$set: {status: 'younger than 30'}}
  )
// 7. Женщинам старше 30 лет (вкл) увеличить зарплату на 1000
db.profiles.updateMany(
    {gender:  "female"},
    {$set: {salary: 'older than 30'}}
  )


db.getCollection('films').find({Rating: "PG-13"}, {Title:1, 'Special Features':1})
db.getCollection('films').distinct("Length")
db.getCollection('films').find({'Replacement Cost':{$gte:"20.00", $lte:"24.00"}}, {Title:1, 'Replacement Cost':1, 'Rental Duration':1})
db.getCollection('films').find({'Special Features':'Behind the Scenes'}, {Title:1, Category:1, Rating:1})
db.getCollection('films').find({Title: 'ZOOLANDER FICTION'}, {"Actors.First name":1, "Actors.Last name":1})
db.getCollection('stores').find({_id:1}, {Address:1, City:1, Country:1})
db.getCollection('films').aggregate([{ $group : { _id : "$Rating", films: { $push: "$Title" } } }])

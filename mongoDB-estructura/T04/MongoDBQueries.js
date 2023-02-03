// 1
db.restaurants.find();
// 2
db.restaurants.find({},{address:0,grades:0});
// 3
db.restaurants.find({},{address:0,grades:0,_id:0});
// 4
db.restaurants.find({},{restaurant_id:1,name:1,borough:1,"address.zipcode":1,_id:0});
// 5
db.restaurants.find({borough:"Bronx"});
// 6
db.restaurants.find({borough:"Bronx"}).limit(5);
// 7
db.restaurants.find({borough:"Bronx"}).skip(5).limit(5);
// 8
db.restaurants.find({"grades.score": {$gt:90}});
// 9
db.restaurants.find( { "grades": { $elemMatch: { score: { $gt: 80, $lt: 100 } } } });
// 10
db.restaurants.find( { "address.coord.0": { $lt: -95.754361 } } );
// 11
// Alguns documents tenen cousine = "American " (amb un espai al final)
db.restaurants.find( { $and: [ { cuisine: { $not: /American/ } }, { "grades.score": { $gt:70 } }, { "address.coord.0": { $lt: -65.754168 } } ] } );
// 12
// Alguns documents tenen cousine = "American " (amb un espai al final)
db.restaurants.find( { cuisine: { $not: /American/ }, "grades.score": { $gt:70 }, "address.coord.0": { $lt: -65.754168 } } );
// 13
db.restaurants.find( { cuisine: { $not: /American/ }, "grades.grade": "A", borough: { $ne: "Bronx" } } ).sort( { cuisine: -1 } );
// 14
db.restaurants.find( { name: /^Wil/ } , { address:0, grades:0, _id:0 } );
// 15
db.restaurants.find( { name: /ces$/ } , { address:0, grades:0, _id:0 } );
// 16
db.restaurants.find( { name: /Reg/ } , { address:0, grades:0, _id:0 } );
// 17
// Alguns documents tenen cousine = "American " (amb un espai al final)
db.restaurants.find( { borough:"Bronx", cuisine: { $in: [ /American/, "Chinese" ] } } );
// 18
db.restaurants.find( { borough: { $in: ["Staten Island", "Queens", "Bronx", "Brooklyn"] } }, { address:0, grades:0, _id:0 } );
// 19
db.restaurants.find( { borough: { $nin: ["Staten Island", "Queens", "Bronx", "Brooklyn"] } }, { address:0, grades:0, _id:0 } );
// 20
db.restaurants.find( { "grades": { $elemMatch: { score: { $lt: 10 } } } }, { address:0, grades:0, _id:0 });
// 21
db.restaurants.find( { $or: [ { cuisine: "Seafood"}, { name: /^Wil/ } ] }, { address:0, grades:0, _id:0 } );
// 22
db.restaurants.find( { grades: {date: ISODate("2014-08-11T00:00:00.000+00:00"), grade: "A", score: 11 } }, { restaurant_id: 1, name: 1, grades:1,_id:0} );
// 23
db.restaurants.find( { "grades.1": {date: ISODate("2014-08-11T00:00:00.000+00:00"), grade: "A", score: 9 } }, { restaurant_id: 1, name: 1, grades:1,_id:0} );
// 24
db.restaurants.find( { "address.coord.1": { $gt: 42, $lt: 52 } }, { borough:0, cuisine:0, grades:0, _id:0 } );
// 25
db.restaurants.find({}).sort( { name: 1, _id: 1 } )
// 26
db.restaurants.find({}).sort( { name: -1, _id: 1 } )
// 27
db.restaurants.find({}).sort( { borough: 1, cuisine: 1, _id: 1 } )
// 28
db.restaurants.find( { "address.street": { $exists: false } } );
db.restaurants.find( { "address.street": { $exists: false } } );
// 29
db.restaurants.find( { coord: { $type: 1 } } )
//30
// no m'en ensurto, aggregation??? $divide?? com trec la resta?
// 31
db.restaurants.find( { name: /mon/ } , { name:1, borough:1, "address.coord": 1, _id:0} );
// 32
db.restaurants.find( { name: /^Mad/ } , { name:1, borough:1, "address.coord": 1, _id:0} );






import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:homerentalui/detailsScreen.dart';

class Option {
  late String title, image;
  Option({required this.image, required this.title});
}

class CategoryList {
  late String category;
  late int index;
  CategoryList(this.category, this.index);
}

class Houses {
  late String id, title, location, image, details;
  List<String> interiors = [];
  Houses(this.id, this.title, this.location, this.image, this.details,
      this.interiors);
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Option> optionsList = [
    Option(image: "assets/house1.jpg", title: "Buy a house"),
    Option(image: 'assets/house2.jpg', title: 'Rent a house')
  ];

  List<CategoryList> categoryList = [
    CategoryList('Popular', 1),
    CategoryList("Recommended", 2),
    CategoryList('Nearest', 3)
  ];
  int currentCategoryListIndex = 1;

  List<Houses> houses = [
    Houses(
        '1',
        'Entire guest suite',
        'East Side Cedar Cottage Toronto',
        'assets/house1.jpg',
        '`This building is located in the Oliver area, withing walking distance of shops...`',
        [
          'assets/interior1.jpg',
          'assets/interior2.jpg',
          'assets/interior3.jpg'
        ]),
    Houses(
        '2',
        'Private room in house',
        'Down town house suite Toronto',
        'assets/house2.jpg',
        'This building is located in the Oliver area, withing walking distance of shops...',
        [
          'assets/interior1.jpg',
          'assets/interior2.jpg',
          'assets/interior3.jpg'
        ]),
    Houses(
        '3',
        'Entire apartment',
        '3Mins to Skytrain/Garden/Stadium/100% Toronto',
        'assets/house3.jpg',
        'This building is located in the Oliver area, withing walking distance of shops...',
        [
          'assets/interior1.jpg',
          'assets/interior2.jpg',
          'assets/interior3.jpg'
        ]),
    Houses(
        '4',
        'Private room in house',
        'Small room in cozy DT Vancouver apartment! Toronto',
        'assets/house4.jpg',
        'This building is located in the Oliver area, withing walking distance of shops...',
        [
          'assets/interior1.jpg',
          'assets/interior2.jpg',
          'assets/interior3.jpg'
        ]),
  ];
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
    ));

    return SafeArea(
        child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 20),
                    child: Text(
                      "location",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      "Canada",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, right: 20),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/person.jpg'))),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xFFf6f6f6),
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.only(left: 20),
                  height: 50,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Search address, city, location',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              TextButton(
                onPressed: () {},
                child: Container(
                  margin: EdgeInsets.only(right: 20),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.tune,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              color: Color(0xFFf6f6f6),
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 210,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: optionsList.map((e) {
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    elevation: 15,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      width: MediaQuery.of(context).size.width * 0.42,
                      child: Column(
                        children: [
                          Container(
                            height: 140,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(e.image))),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            e.title,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  );
                }).toList(),
              )),
          SizedBox(
            height: 40,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: categoryList.map((e) {
                return GestureDetector(
                    onTap: () {
                      setState(() {
                        currentCategoryListIndex = e.index;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        color: e.index == currentCategoryListIndex
                            ? Colors.black
                            : Colors.transparent,
                      ))),
                      child: Text(
                        e.category,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: e.index == currentCategoryListIndex
                                ? Colors.black
                                : Colors.grey),
                      ),
                    ));
              }).toList(),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 300,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: houses.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailsScreen(houses[index])));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 1,
                      height: 250,
                      padding: EdgeInsets.all(15),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.all(15),
                              height: 140,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(houses[index].image))),
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Text(
                                    houses[index].title,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Expanded(
                                  child: Container(),
                                ),
                                Container(
                                  padding: EdgeInsets.only(right: 15),
                                  child: Text(
                                    '\$1500',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 15),
                              child: Text(
                                houses[index].location,
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 15),
                              child: Row(
                                children: [
                                  Icon(Icons.hotel),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '2',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(Icons.bathtub),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '2',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(Icons.aspect_ratio),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '2',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    ));
  }
}

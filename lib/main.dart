import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:simple_star_rating/simple_star_rating.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Products',
      theme: ThemeData(
        primaryColor: Colors.red,
        primarySwatch: Colors.red,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  List<String> carasouleImage = [
    "https://images.pexels.com/photos/1714208/pexels-photo-1714208.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260",
    "https://images.pexels.com/photos/1714341/pexels-photo-1714341.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "https://images.pexels.com/photos/326513/pexels-photo-326513.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
    "https://images.pexels.com/photos/1714340/pexels-photo-1714340.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text("My Products"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Hashmi"),
              accountEmail: Text("hashmi@gmail.com"),
              currentAccountPicture: CircleAvatar(
                child: Text(
                  "H",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ListTile(
              onTap: (){},
              leading: Icon(Icons.list),
              title: Text("My Orders"),
              trailing: Icon(Icons.arrow_forward_ios_sharp),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.red[200],
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (_index) {
          setState(() {
            index = _index;
          });
        },
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.category_outlined,
              ),
              label: "Categories"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_add_alt_1_outlined), label: "Profile"),
        ],
      ),



      body: ListView(
        shrinkWrap: true,
        children: [
          CarouselSlider(

            options: CarouselOptions(
              aspectRatio: 16/9,
              autoPlay: true,
              viewportFraction: 0.9
            ),
            items: carasouleImage.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Image.network(i,fit: BoxFit.cover,));
                },
              );
            }).toList(),
          ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Our Most Liked Products", style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),),
                  TextButton(onPressed: (){}, child: Text("view more...")),
                ],
              ),

              SizedBox(
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.all(8),
                          child: Card(
                            elevation: 5,
                            clipBehavior: Clip.antiAlias,
                            child: AspectRatio(
                                aspectRatio: 1/1,
                                child: Image.network("https://rukminim1.flixcart.com/image/714/857/jnkmykw0/t-shirt/f/n/n/m-youtube-deccan-store-original-imafa84xg6jnschm.jpeg?q=50")
                                ),
                          ),
                        ),
                        Positioned(
                          top: 15,
                          left: 20,
                        
                          child: Chip(
                            backgroundColor: Colors.red,
                            label: Text("50%", style: TextStyle(color: Colors.white),)
                            )
                          ),
                      ],
                    );
                  },
                  ),
              ),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Latest Collections", style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),),
                  TextButton(
                  onPressed: (){}, 
                  child: Text("view more..."),
                  ),
                ],
              ),

              ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                        Container(
                          height: 180,
                          width: MediaQuery.of(context).size.width * 90,
                          child: Card(
                            elevation: 5,
                            clipBehavior: Clip.antiAlias,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left:20.0),
                                    child: Image.network("https://rukminim1.flixcart.com/image/714/857/jnkmykw0/t-shirt/f/n/n/m-youtube-deccan-store-original-imafa84xg6jnschm.jpeg?q=50"),
                                  ),
                                  Container(
                                    
                                    width: MediaQuery.of(context).size.width * 0.5,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Full Sized Youtube Printed T-Shirt", style: TextStyle(
                                          fontSize: 20,
                                        ),),
                                        SizedBox(height: 20,),

                                        SimpleStarRating(
                                          allowHalfRating: true,
                                          starCount: 5,
                                          rating: 3,
                                          size: 22,
                                        
                                          spacing: 8,
                                        ),

                                        SizedBox(height: 20,),

                                        Text("\$500", style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red,
                                          fontSize: 22,
                                        ),)
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),

                        Positioned(
                          top: 5,
                          left: 10,
                          child: Chip(
                          backgroundColor: Colors.red,
                          label: Text("50%", style: TextStyle(
                          color: Colors.white,
                        ),)))
                    ],
                  );
                },
                ),

            ],
          ),
        ),

        ],
      ),
    );
  }
}

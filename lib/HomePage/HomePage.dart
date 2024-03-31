import 'package:flutter/material.dart';
import 'package:oyw/HomePage/Restaurant.dart';
import 'package:oyw/HomePage/profile.dart';
import 'package:oyw/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ignore: prefer_final_fields
  List<Widget>_pages = [
    const MainHomePage(),
    const RestaurantPage(),
    const MainHomePage(),
    const ProfilePage(),
  ];
  int _selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_selectedindex),
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.only(bottom: 0),
        color: Colors.white,
        child: SizedBox(
          height : 64,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding:  const EdgeInsets.only(left: 25,right : 25),
            child : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(child: IconBottomBar(
                  text : "Home",
                  icon : Icons.home,
                  selected : _selectedindex == 0,
                  onTap :(){
                    setState((){
                      _selectedindex = 0;
                    });
                  },
                ),),
                Flexible(child: IconBottomBar(
                  text : "Restaurant",
                  icon : Icons.restaurant,
                  selected : _selectedindex == 1,
                  onTap :(){
                    setState((){
                      _selectedindex = 1;
                    });
                  },
                ),),
                Flexible(child: IconBottomBar(
                  text : "Map",
                  icon : Icons.map,
                  selected : _selectedindex == 2,
                  onTap :(){
                    setState((){
                      _selectedindex = 2;
                    });
                  },
                ),),
                Flexible(child: IconBottomBar(
                  text : "Profile",
                  icon : Icons.person,
                  selected : _selectedindex == 3,
                  onTap :(){
                    setState((){
                      _selectedindex = 3;
                    });
                  },
                ),),
              ],
            )
          )
        )
        ),
    );
  }
}


class MainHomePage extends StatelessWidget {
  const MainHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var he =  MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(top:50),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color.fromARGB(255, 83, 69, 164),
            const Color.fromARGB(255, 66, 53, 165).withOpacity(.8),
            const Color.fromARGB(255, 75, 53, 165).withOpacity(.6),
            const Color.fromARGB(255, 121, 112, 159).withOpacity(.4),
            const Color.fromARGB(255, 70, 53, 165).withOpacity(.2),
            const Color(0xFF6F35A5).withOpacity(.1),
            const Color(0xFF6F35A5).withOpacity(.05),
            const Color(0xFF6F35A5).withOpacity(.025),
          ],
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const TopBar(),
            const SearchInput(),
            const PromoCard(),
            const HeadLine(),
            SizedBox(
              height : he.height * .01,
            ),
            const CardListView(),
            const SHeadLine(),
            SizedBox(
              height : he.height * .01,
            ),
            const MenuListView(),
            Container(
              padding : const EdgeInsets.only(top : 15,right : 25, bottom : 15),
              width : he.width / 1.1,
              child : const Text(
                "Eat that makes you Happy",
                style : TextStyle(
                  color : Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 5, right: 25, bottom: 15),
              height: he.height / 3,
              width: he.width,
              child: GridView.builder(
                itemCount: foodItemList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, mainAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    return Card(foodItemList[index].title,
                        foodItemList[index].imgUrl, 
                        "20 min away");
                  }),
            )
          ],
        ),
      ),
    );
  }
}


class IconBottomBar extends StatelessWidget {
  const IconBottomBar({
  Key ? key,
  required this.icon,
  required this.text,
  // this.isSelected = false,
  required this.selected,
  required this.onTap,
  });
  final IconData icon;
  final String text;
  // final bool isSelected;
  final bool selected;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: onTap, 
          icon: Icon(
            icon,
            color : selected ? kPrimaryColour : Colors.grey,
          )
        ),
        Text(
          text,
          style: TextStyle(
            color : selected ? kPrimaryColour : Colors.grey,
          ),
        )
      ],
    );
  }
}


class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Find Your \n Favorite Food",
            style: TextStyle(
              fontSize : 25,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: Offset(12,16),
                  blurRadius: 50,
                  spreadRadius : 0,
                  color: Colors.grey.withOpacity(.25),
                ),
              ],
            ),
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.food_bank_outlined,
                size : 25,
                color: Color(0xFF6F35A5),
              )
            )
          )
        ],
      )
    );
  }
}


class SearchInput extends StatelessWidget {
  const SearchInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:25,right:25,top:8,bottom:8),
      child : Container(
        decoration : BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset : const Offset(12,26),
              blurRadius :50,
              spreadRadius : 0,
              color: Colors.grey.withOpacity(.15),
            ),

          ],
        ),
        child: TextField(
          onChanged: (value) {

          },
          decoration : const InputDecoration(
            prefixIcon : Icon(Icons.search),
            filled : true,
            fillColor : Colors.white,
            hintText : "Search",
            hintStyle : TextStyle(color : Colors.grey),
            contentPadding : 
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
          ),
        )
      ),
    );
  }
}

class PromoCard extends StatelessWidget {
  const PromoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding : const EdgeInsets.all(25),
      child : Container(
        width : MediaQuery.of(context).size.width,
        height : 150,
        decoration : BoxDecoration(
          borderRadius : BorderRadius.circular(15),
          gradient : const LinearGradient(
            colors : [Color.fromARGB(255, 52, 120, 78), Color(0xFF6F35A5)]
          )
        ),
        child: Stack(
          children: [ 
            Opacity(
              opacity : .5,
              child : Image.network(
                "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/BACKGROUND%202.png?alt=media&token=0d003860-ba2f-4782-a5ee-5d5684cdc244",
                fit : BoxFit.cover
                ),
              ),
              Image.network(
                "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/Image.png?alt=media&token=8256c357-cf86-4f76-8c4d-4322d1ebc06c"),
              const Align(
                alignment: Alignment.topRight,
                child : Padding(
                  padding : EdgeInsets.all(25),
                  child : Text(
                    "Want some\n icecream ?",
                    style : TextStyle(
                      color : Colors.white,
                      fontSize : 22,
                      fontWeight : FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
      )
    );
  }
}

class HeadLine extends StatelessWidget {
  const HeadLine({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding : const EdgeInsets.only(left:25,right:25),
      child : Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children : [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children : [
              Text("Nearest Restaurant",style : TextStyle(fontSize : 18,fontWeight : FontWeight.bold, color : Colors.black),),
              Text("The Best Food for you",style : TextStyle(fontSize : 12,fontWeight : FontWeight.normal, color : Colors.grey),),
            ]
          ),
          Text("View All",style : TextStyle(fontWeight : FontWeight.normal, color : kPrimaryColour),),
        ]
      )
    );
  }
}

class SHeadLine extends StatelessWidget {
  const SHeadLine({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding : const EdgeInsets.only(left:25,right:25),
      child : Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children : [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children : [
              Text("Popular food",style : TextStyle(fontSize : 18,fontWeight : FontWeight.normal, color : Colors.black),),
              Text("Best Food Picked For You",style : TextStyle(fontSize : 18,fontWeight : FontWeight.normal, color : Colors.grey),),
            ]
          ),
          Text("View More",style : TextStyle(fontWeight : FontWeight.normal, color : kPrimaryColour),),
        ]
      )
    );
  }
}

class CardListView extends StatelessWidget {
  const CardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right : 25),
      child : SizedBox(
        width : MediaQuery.of(context).size.width,
        height : 175,
        child : ListView(
          scrollDirection: Axis.horizontal,
          children : const [
            Card(
                "Vegan",
                "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/Resturant%20Image%20(1).png?alt=media&token=461162b1-686b-4b0e-a3ee-fae1cb8b5b33",
                "8 min away"),
            Card(
                "Italian ",
                "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/Restaurant%20Image.png?alt=media&token=43509b4c-269e-4279-8c88-36dc9ed27a66",
                "12 min away"),
            Card(
                "South Indian",
                "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/Resturant%20Image%20(1).png?alt=media&token=461162b1-686b-4b0e-a3ee-fae1cb8b5b33",
                "15 min away"),
            Card(
                "Punjabi",
                "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/Resturant%20Image%20(1).png?alt=media&token=461162b1-686b-4b0e-a3ee-fae1cb8b5b33",
                "15 min away"),
          ],
        ),
      ),
    );
  }
}

class MenuListView extends StatelessWidget {
  const MenuListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 175,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: const [
            Card(
                "Biryani",
                "https://icon2.cleanpng.com/20180330/axe/kisspng-hyderabadi-biryani-indian-cuisine-dish-chicken-mea-biryani-5abedc42d00da9.6620510115224576668522.jpg",
                "15 min away"),
            Card(
                "Pizza ",
                "https://media.istockphoto.com/id/1414575281/photo/a-delicious-and-tasty-italian-pizza-margherita-with-tomatoes-and-buffalo-mozzarella.jpg?s=2048x2048&w=is&k=20&c=VMgkDRJoTv5VLHO4C4SDis7bD4Oiy39SjnQRGDv56FA=",
                "12 min away"),
            Card(
                "South Indian",
                "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/Resturant%20Image%20(1).png?alt=media&token=461162b1-686b-4b0e-a3ee-fae1cb8b5b33",
                "15 min away"),
            Card(
                "Punjabi",
                "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/Resturant%20Image%20(1).png?alt=media&token=461162b1-686b-4b0e-a3ee-fae1cb8b5b33",
                "15 min away"),
          ],
        ),
      ),
    );
  }
}

class Card extends StatelessWidget {
  final String text;
  final String imgUrl;
  final String subtitle;
  const Card(this.text,this.imgUrl,this.subtitle,{Key ? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25,bottom : 15),
      child : Container(
        width : 150,
        height : 150,
        padding : const EdgeInsets.only(top : 25,left : 25,right : 25),
        decoration : BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color : Colors.white,
          boxShadow : [
            BoxShadow(offset :const  Offset(12,16), blurRadius: 20,spreadRadius : 0,color : Colors.grey.withOpacity(.1))
          ],
        ),
        child : Column(
          children : [
            Image.network(
            imgUrl,
            height : 70, 
            fit : BoxFit.cover,
            frameBuilder : (
              BuildContext context, 
              Widget child, 
              int ? frame,
              bool ? wasSynchronouslyLoaded) {
                if(wasSynchronouslyLoaded!) {
                return child;
                }
                else {
                  return AnimatedOpacity(
                    opacity : frame == null ? 0 : 1, 
                    duration : const Duration(seconds : 1), 
                    curve:  Curves.easeOut,
                    child : child,
                  );
                }
            }),
            const Spacer(),
            Text(
              text,
              textAlign: TextAlign.center,
              style : const TextStyle(
                fontSize : 18,
                fontWeight: FontWeight.bold,
                color : Colors.black
                )
              ),
            const SizedBox(
              height :5,
            ),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style : const TextStyle(
                fontSize : 12,
                fontWeight: FontWeight.bold,
                color : Colors.black)
              ),
            const SizedBox(
              height : 10,
            ) 
          ],
        ),
      ),
    );
  }
}
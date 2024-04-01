import 'package:flutter/material.dart';
import 'package:oyw/constants.dart';

class RestaurantDetails extends StatelessWidget {
  final int index;
  const RestaurantDetails({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBar(
          // color : Colors.transparent.withOpacity(1),
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              height: 50,
              decoration: BoxDecoration(
                color: kPrimaryColour,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 50,
                    color: kPrimaryColour.withOpacity(.23),
                  ),
                ],
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Order Now",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ))
                ],
              ))
      ),
      body : MainScreen(index: index,)
    );
  }
}

class MainScreen extends StatelessWidget {
  final int index;
  const MainScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var he = MediaQuery.of(context).size;
    return Container(
        padding: const EdgeInsets.only(top: 50),
        height: he.height,
        width: he.width,
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
            TopImage(index: index),
            Rating(index: index),
            FoodDescription(index: index),
            MenuItem(index: index),
          ],
        )));
  }
}

class TopImage extends StatefulWidget {
  final int index;
  const TopImage({super.key, required this.index});

  @override
  State<TopImage> createState() => _TopImageState();
}

class _TopImageState extends State<TopImage> {
  @override
  Widget build(BuildContext context) {
    var he = MediaQuery.of(context).size;
    return Container(
        height: he.height * 0.3,
        width: he.width,
        decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
            image: DecorationImage(
              image: NetworkImage(restaurantList[widget.index].imgUrl),
              fit: BoxFit.cover,
            )),
        child: Stack(children: [
          Positioned(
              top: 20,
              left: 5,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, size: 24, color: kPrimaryColour),
                onPressed: () {
                  Navigator.pop(context);
                },
              )),
          Positioned(
              top: 20,
              right: 20,
              child: IconButton(
                icon: const Icon(Icons.favorite, size: 28, color: Colors.white),
                onPressed: () {},
              )),
          Positioned(
              bottom: 20,
              left: 20,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(restaurantList[widget.index].title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        )),
                    Text(restaurantList[widget.index].locations,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        )),
                  ]))
        ]));
  }
}

class Rating extends StatelessWidget {
  final int index;
  const Rating({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    var he = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 5, right: 20),
      height: he.height * 0.1,
      width: he.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("${restaurantList[index].rating}   Rating",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              )),
          // const Text("Rating",
          //     style: TextStyle(
          //       color: Colors.black,
          //       fontSize: 15,
          //       fontWeight: FontWeight.w500,
          //     )),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(height: 15),
              Text("${restaurantList[index].price} for one",
                  style: const TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  )),
              const Text("Delivery Time : 30 mins",
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

class FoodDescription extends StatefulWidget {
  const FoodDescription({super.key, required this.index});
  final int index;
  @override
  State<FoodDescription> createState() => _FoodDescriptionState();
}

class _FoodDescriptionState extends State<FoodDescription> {
  bool _showFullText = false;
  @override
  Widget build(BuildContext context) {
    var he = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      width: he.width,
      child: Expanded(
          child: Column(
        children: [
          _showFullText
              ? Text(
                  restaurantList[widget.index].description,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                )
              : Text(
                  restaurantList[widget.index].description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
          _buildButton(),
        ],
      )),
    );
  }

  Widget _buildButton() {
    return TextButton(
        onPressed: () {
          setState(() {
            _showFullText = !_showFullText;
          });
        },
        child: Text(_showFullText ? "Show less" : "Show more"));
  }
}

class MenuItem extends StatefulWidget {
  MenuItem({super.key,required this.index});
  final int index;
  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  late List<bool>_onClick;
  @override
  void initState(){
    super.initState();
    _onClick = List.generate(5,(index) => false);
  }

  @override
  Widget build(BuildContext context) {
    var he = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          padding : const EdgeInsets.only(top : 6,left : 25, right : 25),
          height : he.height * 0.06,
          width : he.width,
          decoration : BoxDecoration(
            color : Colors.transparent.withOpacity(.06),
            borderRadius: const BorderRadius.all(Radius.circular(50)),
          ),
          child : const Row(
            mainAxisAlignment : MainAxisAlignment.spaceBetween,
            crossAxisAlignment : CrossAxisAlignment.center,
            children: [
              Text(
                "Menu",
                style : TextStyle(
                  color : Colors.black,
                  fontSize : 20,
                  fontWeight : FontWeight.w500,
                ),
              ),
              Spacer(),
              Text(
                "View all",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 15,
                color: Colors.black,
              ) ,
            ],
          )
        ),
        for(int i = 0; i < 5; i++)
          Container(
            padding : const EdgeInsets.only(top : 4,left : 25,right : 25),
            height : he.height * 0.06,
            width : he.width,
            margin :const  EdgeInsets.only(bottom : 10),
            decoration : BoxDecoration(
              color : Colors.transparent.withOpacity(0.01),
              borderRadius : const BorderRadius.all(Radius.circular(50)),
            ),
            child : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  restaurantList1[i].title,
                  style : const TextStyle(
                    color : Colors.black,
                    fontSize : 18,
                    fontWeight : FontWeight.w500,
                  )
                ),
                Text(
                  restaurantList1[i].price,
                  style : const TextStyle(
                    color : Colors.black,
                    fontSize : 16,
                    fontWeight : FontWeight.w500,
                  )
                ),
                const SizedBox(width : 10),
                IconButton(onPressed : () {
                  setState(() {
                    _onClick[i] = !_onClick[i];
                  });
                  if(_onClick[i]){
                    //add the oitemto the cart whenthe chekbox is checked
                    //widget.addToCart(restaurantList1[i]);
                  }
                },
                icon : _onClick[i] ? const Icon(Icons.check_box_outline_blank,color : Colors.black)
                          : const Icon(Icons.check_box_outlined,color : Colors.green)
              )
            ],)
          )
      ],
    );
  }
}


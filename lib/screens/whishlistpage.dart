
// ignore_for_file: deprecated_member_use, avoid_print

import 'package:bitnavigatormap/screens/allLists.dart';
import 'package:bitnavigatormap/screens/listOfFaculity.dart';
import 'package:bitnavigatormap/screens/polyLine.dart';
import 'package:bitnavigatormap/screens/whishlist_provider.dart';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

// import '../provider/cart_and _provider.dart';



class WhishlistPage extends StatefulWidget {
  const WhishlistPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _WhishlistPage();
  }
}

class _WhishlistPage extends State<WhishlistPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final cartProvider = Provider.of<CartProvider>(context);
    final whishlistProvider = Provider.of<WhishlistProvider>(context);
    var box = Hive.box<Whishlist>("wishlist_products");

    Future<void> showDialogues(
      BuildContext context,
    ) async {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Confirm Delete"),
              content: const Text(
                  "All the items will be remove from favourite! Do you want to continue?"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("No")),
                TextButton(
                  onPressed: () {
                    whishlistProvider.clearWish();
                    Navigator.pop(context);
                  },
                  child: const Text("Yes"),
                ),
              ],
            );
          });
    }

    return ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (context, Box<Whishlist> box, _) {
          List<Whishlist> wishlist = box.values.toList().cast<Whishlist>();

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: const Text(
                "shortLists",
                style: TextStyle(color: Colors.brown,fontSize: 25, fontWeight: FontWeight.bold),
              ),
              actions: [
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: IconButton(
                      onPressed: () async {
                        await showDialogues(
                          context,
                        );
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 30,
                      )),
                )
              ],
              centerTitle: true,
              elevation: 0,
            ),
            body: wishlist.isEmpty
                ? SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Container(
                            padding: const EdgeInsets.all(20),
                            child: Text(
                              "No shortList!",
                              style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            )),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 55),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 50),
                                shape: const RoundedRectangleBorder(),


primary: Theme.of(context).accentColor),
                            onPressed: () {
                              // Navigator.pop(c/ontext);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  // ignore: prefer_const_constructors
                                  builder: (context) => allLists(),
                                ),
                              );
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(top: 10.0, bottom: 10),
                              child: Text(
                                "Add Some",
                                style: TextStyle(fontSize: 25),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: wishlist.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 1,
                        child: ListTile(
                          onTap: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context)=>));
                          },
                          tileColor: Colors.grey[100],
                          leading: GestureDetector(
                                       onTap: ()
                                       {
                                      Navigator.push(
                                      context,
                                       MaterialPageRoute(
                                      builder: (context) =>
                                          polyLineplaces(id:wishlist[index].title, title: wishlist[index].id),
                                    )
                                    );

                                       },
                                      child:const Icon(
                                       Icons.navigation,
                                       color: Colors.orange,

                                   ),
                                       ),
                          title: Text(
                            wishlist[index].id,
                            style: const TextStyle(
                                 fontSize: 18),
                            overflow: TextOverflow.ellipsis,
                          ),

                          trailing: IconButton(
                            onPressed: () {
                              whishlistProvider
                                  .removeItem(wishlist[index].title);
                              print(wishlist[index].id);
                            },
                            icon: const Icon(
                              Icons.favorite,
                              color: Colors.orange,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          );
        });
  }
}
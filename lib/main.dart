import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'global.dart';
void main() {
  runApp(
    const CupertinoApp(
      theme: CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
          textStyle: TextStyle(fontFamily: 'Iphone'),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  final search = ValueNotifier<String>('');
  String name = "", email = "", location = "";
  int totalPrice = 0;
  DateTime dateTime = DateTime.now();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final locationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        height: 50,
        activeColor: CupertinoColors.systemBlue,
        backgroundColor: const Color(0xFFF4F6F3),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.house_fill), label: " Home"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search), label: " Search"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.cart), label: " Cart"),
        ],
      ),
      tabBuilder: (context, i) {
        return StatefulBuilder(
          builder: (context, _) {
            return CupertinoTabView(builder: (context) {
              return IndexedStack(
                index: i,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 80, left: 20, bottom: 15),
                        child: Text(
                          "Cupertino Store",
                          style: TextStyle(
                            fontSize: 35,
                            letterSpacing: 0.3,
                            color: CupertinoColors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const Divider(height: 0.8, color: Colors.grey),
                      Expanded(
                        child: Container(
                          color: CupertinoColors.white,
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              children: Global.productList.map((e) {
                                return Column(
                                  children: [
                                    Container(
                                      color: CupertinoColors.white,
                                      padding: const EdgeInsets.only(
                                          left: 20, top: 10, bottom: 10),
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(8),
                                            height: 70,
                                            width: 70,
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFF4F6F3),
                                              borderRadius:
                                              BorderRadius.circular(10),
                                            ),
                                            child: Image.asset(e['image']),
                                          ),
                                          const SizedBox(width: 15),
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                e['name'],
                                                style: const TextStyle(
                                                    color:
                                                    CupertinoColors.black,
                                                    fontSize: 20),
                                              ),
                                              const SizedBox(height: 8),
                                              Text(
                                                "\$${e['price']}",
                                                style: const TextStyle(
                                                    color: CupertinoColors
                                                        .systemGrey,
                                                    fontSize: 14),
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          CupertinoButton(
                                            child: (!e['cart'])
                                                ? const Icon(
                                                CupertinoIcons.cart)
                                                : const Icon(
                                                CupertinoIcons.cart_fill),
                                            onPressed: () {
                                              setState(() {
                                                e['cart'] = !e['cart'];
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: (Global.productList.length -
                                              1 ==
                                              Global.productList.indexOf(e))
                                              ? 0
                                              : 100),
                                      child: const Divider(
                                          height: 0.8, color: Colors.grey),
                                    ),
                                  ],
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 80, left: 20, bottom: 15, right: 20),
                        child: SizedBox(
                          height: 40,
                          child: CupertinoSearchTextField(
                            style: const TextStyle(
                                color: CupertinoColors.black, fontSize: 16),
                            placeholderStyle: const TextStyle(
                                color: CupertinoColors.systemGrey,
                                fontSize: 16),
                            itemSize: 22,
                            onChanged: (val) {
                              setState(() {
                                search.value = val;
                              });
                            },
                          ),
                        ),
                      ),
                      const Divider(height: 0.8, color: Colors.grey),
                      Expanded(
                        child: Container(
                          color: CupertinoColors.white,
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              children: Global.productList.map((e) {
                                if (e['name']
                                    .toString()
                                    .toUpperCase()
                                    .contains(search.value.toUpperCase())) {
                                  return Column(
                                    children: [
                                      Container(
                                        color: CupertinoColors.white,
                                        padding: const EdgeInsets.only(
                                            left: 20, top: 10, bottom: 10),
                                        child: Row(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(8),
                                              height: 70,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFF4F6F3),
                                                borderRadius:
                                                BorderRadius.circular(10),
                                              ),
                                              child: Image.asset(e['image']),
                                            ),
                                            const SizedBox(width: 15),
                                            Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  e['name'],
                                                  style: const TextStyle(
                                                      color:
                                                      CupertinoColors.black,
                                                      fontSize: 20),
                                                ),
                                                const SizedBox(height: 8),
                                                Text(
                                                  "\$${e['price']}",
                                                  style: const TextStyle(
                                                      color: CupertinoColors
                                                          .systemGrey,
                                                      fontSize: 14),
                                                ),
                                              ],
                                            ),
                                            const Spacer(),
                                            CupertinoButton(
                                              child: (!e['cart'])
                                                  ? const Icon(
                                                  CupertinoIcons.cart)
                                                  : const Icon(
                                                  CupertinoIcons.cart_fill),
                                              onPressed: () {
                                                setState(() {
                                                  e['cart'] = !e['cart'];
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: (Global.productList.length -
                                                1 ==
                                                Global.productList
                                                    .indexOf(e))
                                                ? 0
                                                : 100),
                                        child: const Divider(
                                            height: 0.8, color: Colors.grey),
                                      ),
                                    ],
                                  );
                                }
                                return Container();
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 80, left: 20, bottom: 15),
                        child: Text(
                          "Shopping Cart",
                          style: TextStyle(
                            fontSize: 35,
                            letterSpacing: 0.3,
                            color: CupertinoColors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const Divider(height: 0.8, color: Colors.grey),
                      Expanded(
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                CupertinoTextField(
                                  controller: nameController,
                                  keyboardType: TextInputType.name,
                                  textInputAction: TextInputAction.next,
                                  prefix: const Padding(
                                    padding: EdgeInsets.only(
                                        top: 8.0, bottom: 8.0, left: 8.0),
                                    child: Icon(
                                      CupertinoIcons.person_crop_circle,
                                      color: CupertinoColors.systemGrey,
                                    ),
                                  ),
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Iphone',
                                      color: CupertinoColors.black),
                                  placeholder: "Full Name",
                                  placeholderStyle: const TextStyle(
                                      fontFamily: 'Iphone', color: Colors.grey),
                                  suffixMode: OverlayVisibilityMode.editing,
                                  suffix: CupertinoButton(
                                    padding: const EdgeInsets.all(0.0),
                                    child: const Icon(
                                      CupertinoIcons.clear_circled,
                                      color: CupertinoColors.systemGrey,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        nameController.clear();
                                        name = "";
                                      });
                                    },
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 13, horizontal: 6),
                                  onChanged: (val) {
                                    setState(() {
                                      name = val;
                                    });
                                  },
                                ),
                                const SizedBox(height: 10),
                                CupertinoTextField(
                                  controller: emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                  prefix: const Padding(
                                    padding: EdgeInsets.only(
                                        top: 8.0, bottom: 8.0, left: 8.0),
                                    child: Icon(
                                      CupertinoIcons.mail,
                                      color: CupertinoColors.systemGrey,
                                    ),
                                  ),
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Iphone',
                                      color: CupertinoColors.black),
                                  placeholder: "Email ID",
                                  placeholderStyle: const TextStyle(
                                      fontFamily: 'Iphone', color: Colors.grey),
                                  suffixMode: OverlayVisibilityMode.editing,
                                  suffix: CupertinoButton(
                                    padding: const EdgeInsets.all(0.0),
                                    child: const Icon(
                                      CupertinoIcons.clear_circled,
                                      color: CupertinoColors.systemGrey,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        emailController.clear();
                                        email = "";
                                      });
                                    },
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 13, horizontal: 6),
                                  onChanged: (val) {
                                    setState(() {
                                      email = val;
                                    });
                                  },
                                ),
                                const SizedBox(height: 10),
                                CupertinoTextField(
                                  controller: locationController,
                                  keyboardType: TextInputType.name,
                                  textInputAction: TextInputAction.next,
                                  prefix: const Padding(
                                    padding: EdgeInsets.only(
                                        top: 8.0, bottom: 8.0, left: 8.0),
                                    child: Icon(
                                      CupertinoIcons.location_fill,
                                      color: CupertinoColors.systemGrey,
                                    ),
                                  ),
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Iphone',
                                      color: CupertinoColors.black),
                                  placeholder: "Location",
                                  placeholderStyle: const TextStyle(
                                      fontFamily: 'Iphone', color: Colors.grey),
                                  suffixMode: OverlayVisibilityMode.editing,
                                  suffix: CupertinoButton(
                                    padding: const EdgeInsets.all(0.0),
                                    child: const Icon(
                                      CupertinoIcons.clear_circled,
                                      color: CupertinoColors.systemGrey,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        locationController.clear();
                                        location = "";
                                      });
                                    },
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 13, horizontal: 6),
                                  onChanged: (val) {
                                    setState(() {
                                      location = val;
                                    });
                                  },
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  decoration: BoxDecoration(
                                    color: CupertinoColors.white,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(7),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        const Icon(
                                          CupertinoIcons.clock,
                                          color: CupertinoColors.systemGrey,
                                          size: 28,
                                        ),
                                        const SizedBox(width: 6),
                                        const Text(
                                          'Delivery time',
                                          style: TextStyle(
                                              color: CupertinoColors.systemGrey,
                                              fontSize: 16
                                          ),
                                        ),
                                        const Spacer(),
                                        Text(
                                          DateFormat.yMMMd().add_jm().format(dateTime),
                                          style: const TextStyle(
                                            color: CupertinoColors.systemGrey,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                SizedBox(
                                  height: 200,
                                  child: CupertinoDatePicker(
                                    mode: CupertinoDatePickerMode.dateAndTime,
                                    initialDateTime: dateTime,
                                    onDateTimeChanged: (newDateTime) {
                                      setState(() {
                                        dateTime = newDateTime;
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(height: 10),
                                ...Global.productList.map((e) {
                                  if (e['cart']) {
                                    totalPrice = totalPrice + int.parse(e['price']);
                                    return Card(
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(8),
                                            height: 70,
                                            width: 70,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(10),
                                            ),
                                            child: Image.asset(e['image']),
                                          ),
                                          const SizedBox(width: 10),
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                e['name'],
                                                style: const TextStyle(
                                                    color:
                                                    CupertinoColors.black,
                                                    fontSize: 18,
                                                    fontFamily: 'Iphone'),
                                              ),
                                              const SizedBox(height: 8),
                                              Text(
                                                "\$${e['price']}",
                                                style: const TextStyle(
                                                    color: CupertinoColors
                                                        .systemGrey,
                                                    fontSize: 14,
                                                    fontFamily: 'Iphone'),
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          CupertinoButton(
                                            child: (!e['cart'])
                                                ? const Icon(
                                                CupertinoIcons.cart)
                                                : const Icon(
                                                CupertinoIcons.cart_fill),
                                            onPressed: () {
                                              setState(() {
                                                e['cart'] = !e['cart'];
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                  return Container();
                                }).toList(),
                                const SizedBox(height: 20),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "Total Price : \$$totalPrice",
                                    style: const TextStyle(
                                        color: CupertinoColors.black,
                                        fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            });
          },
        );
      },
      backgroundColor: const Color(0xFFF4F6F3),
    );
  }
}
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(21, 21, 21, 1),
        title: const Text('Cashier', style: TextStyle(color: Colors.blue),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              TextField(),
              SizedBox(height: 14,),
              Card(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                    children: [
                      Container(
                        height: 120,
                        child: Image.network("https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcSHOX-6JEup_iIkzcdJjTotXqUFvfxUz_d3RJYWlEJNRq76yMxvNdcG05od2z-tb5hiLySqHbvzrlXKoFy2MJfPouQN1g6tQxILjKL74wwFWPMVyma89gKa&usqp=CAE")),
                        Column(
                          children: [
                            Text("Capucinno"),
                            Text("Rp. 20.000")
                          ],),
                          SizedBox(
                            height: 40,
                            child: ElevatedButton(onPressed: (){}, child: Icon(Icons.add)))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}

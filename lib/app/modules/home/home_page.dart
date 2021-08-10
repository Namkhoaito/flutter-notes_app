import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/app/modules/home/home_controller.dart';
import 'package:note_app/app/modules/home/local_widget/note_card.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeController _homeController = Get.find<HomeController>();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ghi chú',
          style: TextStyle(
              color: Colors.grey[800],
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.grey[200],
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.sync,
              color: Colors.grey[800],
            ),
            onPressed: _homeController.updateOnline,
          ),
          IconButton(
            onPressed: _homeController.logOut,
            icon: Icon(
              Icons.logout,
              color: Colors.grey[800],
            ),
          )
        ],
      ),
      body: Container(
        color: Colors.grey[200],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(20, 10, 20, 40),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: TextField(
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[800],
                ),
                decoration: InputDecoration(
                    hintText: 'Tìm kiếm ghi chú',
                    hintStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[500],
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey[800],
                    ),
                    border: InputBorder.none),
              ),
            ),
            Expanded(
              child: Obx(
                () {
                  return Container(
                    child: _homeController.notes.length != 0
                        ? ListView.builder(
                            itemCount: _homeController.notes.length,
                            itemBuilder: (context, index) {
                              return NoteCard(
                                notes: _homeController.notes[index],
                                size: size,
                                onClick: () {
                                  _homeController
                                      .onTap(_homeController.notes[index]);
                                },
                                onSwipe: () {
                                  _homeController
                                      .deleteNote(_homeController.notes[index]);
                                },
                              );
                            })
                        : Center(child: Text('Ghi chú trống')),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _homeController.addClick,
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}

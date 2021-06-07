import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:note_app/app/modules/creatnotes/creatnotes_controller.dart';
import 'local_widget/radioCustom.dart';

class CreatNotesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    CreatNotesController _creatNotesController =
        Get.find<CreatNotesController>();
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              height: size.height * 0.23,
              padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
              color: Colors.grey[200],
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RaisedButton(
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        onPressed: _creatNotesController.backPress,
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      RaisedButton(
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        onPressed: _creatNotesController.savePress,
                        child: Text(
                          'Lưu',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RadioCustom(
                            size: size,
                            index: 0,
                            creatNotesController: _creatNotesController),
                        SizedBox(
                          width: 10,
                        ),
                        RadioCustom(
                            size: size,
                            index: 1,
                            creatNotesController: _creatNotesController),
                        SizedBox(
                          width: 10,
                        ),
                        RadioCustom(
                            size: size,
                            index: 2,
                            creatNotesController: _creatNotesController),
                        SizedBox(
                          width: 10,
                        ),
                        RadioCustom(
                            size: size,
                            index: 3,
                            creatNotesController: _creatNotesController),
                        SizedBox(
                          width: 10,
                        ),
                        RadioCustom(
                            size: size,
                            index: 4,
                            creatNotesController: _creatNotesController),
                        SizedBox(
                          width: 10,
                        ),
                        RadioCustom(
                          size: size,
                          index: 5,
                          creatNotesController: _creatNotesController,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(25)),
                  ),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _creatNotesController.txtTitle,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          border: InputBorder.none,
                          hintText: 'Tiêu đề',
                          hintStyle: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[400]),
                        ),
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                      // Expanded(
                      //   child: TextFormField(
                      //     controller: _creatNotesController.txtContent,
                      //     decoration: InputDecoration(
                      //       contentPadding: EdgeInsets.symmetric(
                      //           horizontal: 20, vertical: 5),
                      //       border: InputBorder.none,
                      //       hintText: 'Nội dung',
                      //       hintStyle: TextStyle(
                      //           fontSize: 20, color: Colors.grey[400]),
                      //     ),
                      //     maxLines: 99999999999,
                      //     style: TextStyle(fontSize: 20),
                      //   ),
                      // ),

                      ToolbarWidget(
                        controller: _creatNotesController.controller,
                        htmlToolbarOptions: HtmlToolbarOptions(
                          toolbarPosition: ToolbarPosition
                              .custom, //required to place toolbar anywhere!
                          //other options
                        ),
                      ),
                      HtmlEditor(
                        controller: _creatNotesController.controller, //required
                        htmlEditorOptions: HtmlEditorOptions(
                          hint: "Your text here...",
                          //initalText: "text content initial, if any",
                        ),
                        otherOptions: OtherOptions(
                          height: 400,
                        ),
                      ),
                      Text(_creatNotesController.controller
                          .getText()
                          .toString()),
                    ],
                  )),
            )
          ],
        ),
        color: Colors.grey[200],
      ),
    );
  }
}

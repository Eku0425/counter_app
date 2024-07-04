import 'package:flutter/material.dart';
import 'dart:io';


import 'package:image_picker/image_picker.dart';

import '../modal.dart';

class studentcardWidget extends StatelessWidget {
  final studetmodal student;
  final VoidCallback onDelete;
  studentcardWidget(
      {Key ?key, required this.student, required this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            InkWell(
              highlightColor: Colors.blue,
              onTap:() => SetImage(),
              child: CircleAvatar(
                backgroundColor: Colors.blueGrey,
                radius: 60,
                backgroundImage:  (student.student_image != null) ? FileImage(
                    student.student_image!) : null,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.camera_alt),
                      ],
                    ),
                  ],
                ),


              ),
            ),
            Row(
              children: [

                Container(
                  height: 65,
                  width: 295,
                  child: TextFormField(
                    initialValue: student.student_name,
                    onChanged: (value) {
                      student.student_name = value;
                    },
                    decoration: InputDecoration(labelText: 'Student Name',),
                  ),
                ),

                SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: () {

                  },
                  child: Icon(Icons.edit),
                  backgroundColor: Colors.blue[300],
                ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    initialValue: student.student_grid.toString(),
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      student.student_grid = int.tryParse(value) ?? 0;
                    },
                    decoration: InputDecoration(labelText: 'GrId'),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    initialValue: student.student_name,
                    onChanged: (value) {
                      student.student_standard = value;
                    },
                    decoration: InputDecoration(labelText: 'Student Standard',),
                  ),
                ),
                FloatingActionButton(
                  child: Icon(Icons.delete),
                  backgroundColor: Colors.blue[300],
                  onPressed: onDelete,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
  ImagePicker imagePicker = ImagePicker();


  Future<void> SetImage() async {
    XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);
    student.student_image = File(image!.path);
  }

//   ImagePicker imagePicker = ImagePicker();
//
//
//   Future<void> SetImage() async {
//     XFile? image = await imagePicker.pickImage(source: ImageSource.camera);
//     student.student_image = File(image!.path);
//
}

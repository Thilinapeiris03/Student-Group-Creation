import 'package:flutter/material.dart';

class GroupCreation extends StatefulWidget {
  const GroupCreation({Key? key}) : super(key: key);

  @override
  State<GroupCreation> createState() => _GroupCreationState();
}

class _GroupCreationState extends State<GroupCreation> {
  List<String> studentList = [];
  TextEditingController nameController = TextEditingController();
  List<List<String>> groups = [];


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: nameController,
            decoration: InputDecoration(
              labelText: 'Enter Name by Name',
              suffixIcon: IconButton(
                onPressed: () {
                  if (nameController.text.isNotEmpty) {
                    newName(nameController.text);
                  }
                },
                icon: const Icon(Icons.add),
                color: Colors.white,
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: studentList.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(
                  studentList[index],
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: groupCreation,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: const Text(
                'Created Groups',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: clearList,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text(
                'Clear List',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }

  
  void newName(String name) {
    setState(() {
      studentList.add(name);
      nameController.clear();
    });
  }



    void groupCreation() {
    studentList.shuffle();
    groups.clear();

    for (var i = 0; i < studentList.length; i += 5) {
      groups.add(studentList.sublist(i, i + 5 > studentList.length ? studentList.length : i + 5));
    }

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Groups'),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            // shrinkWrap: true,
            itemCount: groups.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  title: Text('Group ${index + 1}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: groups[index].map((name) => Text(name)).toList(),
                  ),
                ),
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void clearList() {
    setState(() {
      studentList.clear();
    });
  }
}

import 'package:flutter/material.dart';

class TaskListTile extends StatelessWidget {
  const TaskListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text("have a title"),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("hare subtitle"),
          const Text("Date"),
          Row(
            children: [
              const Chip(
                label: Text("New",style: TextStyle(
                    color: Colors.white
                ),),
                backgroundColor: Colors.blue,),
              const Spacer(),
              IconButton(onPressed: (){},
                  icon: Icon(Icons.edit)),
              IconButton(onPressed: (){},
                  icon: Icon(Icons.delete_forever)),

            ],
          )
        ],
      ),
    );
  }
}
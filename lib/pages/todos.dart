import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/components/add_todo_modal_bottom_sheet.dart';
import 'package:todo_app/components/search_bar.dart';
import 'package:todo_app/components/todo_tile.dart';
import 'package:todo_app/providers/todo_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class TodosPage extends StatefulWidget {
  const TodosPage({super.key});
  @override
  Apptodo createState() =>   Apptodo();
}

class  Apptodo extends State<TodosPage> {
  final Stream<QuerySnapshot> adresseCollection = FirebaseFirestore.instance.collection('note').snapshots();
  void refreshCollection() {
    setState(() {}); // Rafraîchir la page en appelant setState
  }

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    final provider = Provider.of<TodoProvider>(context);
    var todos = provider.allTodos
        .where(
          (element) => !element.isComplete && !element.toBeDeleted,
        )
        .toList();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () => showModalBottomSheet(
          context: context,
          builder: (BuildContext context) =>
              Wrap(children: const [AddTaskModalBottomSheet()]),
        ),
        child: const Icon(
          LineIcons.plus,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Expanded(child: SearchBar()),
            IconButton(
              onPressed: () {},
              icon: const Icon(LineIcons.horizontalSliders,color: Colors.black,),
            ),
          ]),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Visibility(
                visible: todos.isNotEmpty,
                replacement: const Center(
                  child: Text(
                    "You have no tasks",
                    style: TextStyle(letterSpacing: 0.1),
                  ),
                ),
                //child: ListView.builder(
                    //shrinkWrap: true,
                    //itemCount: todos.length,
                    //itemBuilder: (context, index) =>
                       // TodoTile(todo: todos[index])),

                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('note').snapshots(),
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return const Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Text("Loading");
                    }

                    return ListView (
                      children: snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                        return ListTile(
                          title: Row(
                            children: [
                              Text(data['title']),
                              SizedBox(width: 8),
                              // Ajouter "Fait!" si la case est cochée
                            ],
                          ),
                          subtitle: Row(
                            children: [
                              Text(data['category']),
                              SizedBox(width: 8),
                              Text(data['date'].toString()),
                              SizedBox(width: 8),
                              Text(data['time'].toString()),
                            ],
                          ),


                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () async {
                              await FirebaseFirestore.instance.collection('note').doc(document.id).delete();
                            },

                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

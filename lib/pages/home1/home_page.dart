import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get_storage/get_storage.dart';
import 'package:test_get/models/Post.dart';
import 'home_controller.dart';
import 'item_of_Post.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({Key? key}) : super(key: key);

  @override
  _HomePage1State createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  // final _controller = Get.put(HomeController1());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _controller.getPostList();
   //  final box = GetStorage();
   //
   // var items = box.read ('postList');
   // if (items == null){
   //   _controller.apiPostList();
   // } else {
   //   List<Post> mylist = items;
   //   print(mylist[0]);
   //   // _controller.items.value = items  ;
   // }
   //  // print(items);
// _controller.getPostList();
    Get.find<HomeController1>().getPostList();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController1>(
      init: HomeController1(),
      builder: (_controller)
      => Scaffold(
        appBar: AppBar(
          title: Text("setState"),
        ),
        body:
                Stack(
              children: [
                ListView.builder(
                  itemCount: _controller.items.length,
                  itemBuilder: (ctx, index) {
                    return itemOfPost(_controller, _controller.items[index], index);
                  },
                ),
                _controller.isLoading
                // _controller.isLoading.isTrue
                    ? Center(
                  child: CircularProgressIndicator(),
                )
                    : SizedBox.shrink(),
              ],
            ),




        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          onPressed: () {
            DateTime dateTime = DateTime.now();
            Post newPost = Post(title:"New Created post", body: "Post created: $dateTime", id: 1, userId: 1);
            _controller.apiPostCreate(newPost);
            // Respond to button press
          },
          child: Icon(Icons.add),
        )
        ),
    );
  }
}

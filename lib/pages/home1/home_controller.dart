
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:test_get/models/Post.dart';
import 'package:test_get/services/http_service.dart';

class HomeController1 extends GetxController {
  bool  isLoading = false;//.obs;
  List<Post> items = <Post>[];//.obs;
  // RxList<Post> items = <Post>[].obs;

  Future getPostList() async {
    List? postItems = GetStorage().read<List>('postList');

    if (postItems != null) {
      items = postItems
          .map((e) => Post.fromJson(e))
          .toList()
          .obs;
      update();
      // print(items[0].body);
    } else {
      apiPostList();

    }
  }
  Future apiPostList() async {
    final box = GetStorage();
    // isLoading.value = true;
    isLoading = true;
    update();
    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if (response != null) {
      items = Network.parsePostList(response);
      box.write('postList', items);
    } else {
      // items = <Post>[];
    }
    isLoading = false;
    update();
    // isLoading.value = false;
  }

  Future apiPostDelete(Post post, int index) async {
    isLoading = true;
    update();
    // isLoading.value = true;
    var response = await Network.DEL(
        Network.API_DELETE + post.id.toString(), Network.paramsEmpty());
    if (response != null) {
      // _apiPostList();
      _deleteItem(index);
    }
    // isLoading.value = false;
    isLoading = false;
    update();
  }

  void apiPostEdit(Post post, int index) async {
    isLoading = true;
    update();
    // isLoading.value = true;
    var response = await Network.PUT(
        Network.API_UPDATE + post.id.toString(), Network.paramsUpdate(post));
    if (response != null) {
      // _apiPostList();
      _updateItem(post, index);
    }
    isLoading = false;
    update();
    print(post.body);
    // isLoading.value = false;
  }
  void apiPostCreate(Post post) async {
    isLoading = true;
    update();
    // isLoading.value = true;
    var response = await Network.POST(
        Network.API_CREATE , Network.paramsCreate(post));
    if (response != null) {
      // _apiPostList();
      _createItem(post);
    }
    // isLoading.value = false;
    isLoading = false;
    update();

  }

  _deleteItem(int index) {
    items.removeAt(index);
    update();
  }

  _updateItem(Post post, int index) {
    items[index] = post;
    update();
  }
  _createItem(Post post){
    items.add(post);
    update();
  }
}
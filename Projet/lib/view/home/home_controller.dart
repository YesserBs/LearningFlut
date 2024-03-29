import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../objects/article.dart';

class HomeController extends GetxController {
  final articles = <Article>[].obs;
  final filteredArticles = <Article>[].obs;
  final showAd = true.obs;
  var type = "FOR YOU".obs;
  String searchedText = "";

  @override
  void onInit() {
    super.onInit();
    fetchArticles();
  }

  // If there is a problem with fetching, consider updating the security rules in firebase
  void fetchArticles() async {
    try {
      final QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('items').get();
      final List<Article> fetchedArticles = snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>?;
        print("Data: $data");
        return Article(
          uid: doc.id,
          nom: data?['nom'] as String? ?? '',
          marque: data?['marque'] as String? ?? '',
          type: data?['type'] as String? ?? '',
          description: data?['description'] as String? ?? '',
          prix: data?['prix'] as int? ?? 0,
          image: List<String>.from(data?['image'] ?? []), // Fetch and store the 'image' array
        );
      }).toList();
      articles.value = fetchedArticles;
      filteredArticles.value = fetchedArticles;
    } catch (e) {
      print('Error fetching articles: $e');
    }
  }


  void filterList(String value) {

    if (type.value == '' || type.value == 'FOR YOU'){
      if (value.isEmpty) {
        filteredArticles.value = articles;
      } else {
        filteredArticles.value = articles
            .where((article) => article.nom.toLowerCase().contains(value.toLowerCase()))
            .toList();
      }
    }
    else{
      if (value.isEmpty) {
        filteredArticles.value = articles
            .where((article) =>
            article.type.toLowerCase() == type.value.toLowerCase())
            .toList();
      } else {
        filteredArticles.value = articles
            .where((article) => article.nom.toLowerCase().contains(value.toLowerCase())
            &&
            article.type.toLowerCase() == type.value.toLowerCase())
            .toList();
      }
    }
  }

  void toggleShowImage() {
    showAd.value = !showAd.value;
  }

  void getSearchText(String value){
    searchedText = value;
    filterList(value);
  }
}

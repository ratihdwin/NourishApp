import 'dart:convert';
import 'package:http/http.dart' as http;

getArticle(String title) async {
  // Kirim permintaan HTTP GET untuk mendapatkan data artikel dari Firestore
  final response = await http.get(
    Uri.parse(
      "https://firestore.googleapis.com/v1/projects/nourishapp-85cba/databases/(default)/documents/article/$title",
    ),
  );

  if (response.statusCode == 200) {                             // Jika respons memiliki status kode 200 (OK)
    final bodyResponse = jsonDecode(response.body)["fields"];   // Mendekodekan respons JSON dan mengakses bidang "fields"
    return {
      "desc": bodyResponse["desc"]["stringValue"],
      "image": bodyResponse["image"]["stringValue"]
    };
  }
}

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mie_ayam_flutter_app/data/remote/response/ListMieAyamResponse.dart';

Future<ListMieAyamResponse> fetchMieAyamList() async {
  final response = await http
      .get(Uri.parse("https://mie-ayam-api.vercel.app/api/mieayam"));

  if (response.statusCode == 200) {
    return ListMieAyamResponse.fromJson(jsonDecode(response.body) as Map<String?, dynamic>);
  } else if (response.statusCode == 500) {
    throw Exception('Failed to a Load');
  } else {
    throw Exception('Failed to a Load');
  }

}
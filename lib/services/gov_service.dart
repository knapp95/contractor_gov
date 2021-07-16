import 'dart:convert';

import 'package:contractor_gov/models/contractor/contractor_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GovService {
  static const String API = "https://wl-api.mf.gov.pl/api";
  static final GovService _singleton = GovService._internal();

  factory GovService() {
    return _singleton;
  }

  GovService._internal();

  static GovService get singleton => _singleton;

  Future<ContractorModel?> searchContractor(context,
      {required String type, required String value,required String date}) async {
    ContractorModel? contractorModel;

    final url = '${GovService.API}/search/$type/$value?date=$date';
    try {
      http.Response response = await http.get(Uri.parse(url));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final extractedResult = extractedData['result'];
      if (extractedResult != null && extractedResult['subject'] != null) {
        contractorModel = ContractorModel.fromJson(extractedResult['subject']);
      } else {
        final message = extractedData['message'];
        if (message != null) {
          final snackBar = SnackBar(
            content: Text(message),
            backgroundColor: Colors.red.withOpacity(0.9),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      }
      return contractorModel;
    } catch (e) {
      throw e;
    }
  }
}

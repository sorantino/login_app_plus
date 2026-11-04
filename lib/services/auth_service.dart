// lib/services/auth_service.dart

import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

class AuthService {
  // Méthode de hachage des mots de passe
  String hashPassword(String password) {
    final bytes = utf8.encode(password); // Convertit le mot de passe en bytes
    final digest = sha256.convert(bytes); // Applique SHA-256
    return digest.toString(); // Retourne le hachage en chaîne hexadécimale
  }

  Future<Map<String, dynamic>?> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('https://temp.itds.fr/login_tst_local.php'),
        body: {'email': email, 'password': password},
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 && data['status'] == 200) {
        return {
          'firstName': data['firstName'],
          'lastName': data['lastName'],
          'role': data['role'].toString(),
        };
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}

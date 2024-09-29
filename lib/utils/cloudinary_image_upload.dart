import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String?> uploadImageToCloudinary(File imageFile) async {
  String uploadUrl = 'https://api.cloudinary.com/v1_1/ddyiuypso/image/upload';

  // Replace with your Cloudinary API key
  String apiKey = '156375578216614';

  var request = http.MultipartRequest('POST', Uri.parse(uploadUrl));

  request.fields['upload_preset'] = 'nyedowola';  // optional if you created an unsigned upload preset
  request.fields['api_key'] = apiKey;

  // Attach the image file
  request.files.add(await http.MultipartFile.fromPath('file', imageFile.path));

  var response = await request.send();

  if (response.statusCode == 200) {
    var responseData = await http.Response.fromStream(response);
    var jsonData = json.decode(responseData.body);
    return jsonData['secure_url']; // Get the uploaded image URL
  } else {
    print('Image upload failed: ${response.statusCode}');
    return null;
  }
}

import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  ModelConfigurationStruct _ModelConfiguration =
      ModelConfigurationStruct.fromSerializableMap(jsonDecode(
          '{\"geminiModelName\":\"gemini-1.5-flash\",\"systemInstructions\":\"You are an expert assistant specialized in helping expatriates living in Germany. Your role is to provide guidance and support on a wide range of expat-related topics, ensuring your responses are clear and actionable.\\n\\nSpecial Capabilities:\\n- Image Analysis: You can analyze images provided by users (e.g., German documents, forms, signs, or rental listings) and provide explanations or translations\\n- Audio Processing: You can analyze German audio clips to help with pronunciation, comprehension, or transcription\\n\\nChoose the most appropriate response format based on the context:\\n\\n1. TextMessage\\n   Use for: Detailed explanations, step-by-step instructions,  comprehensive answers, when greeting the user, or any time a more specific card doesn\'t fit the situation\\n   Example Query: \\\"How does the German healthcare system work?\\\"\\n   Response:\\n   {\\n     \\\"type\\\": \\\"TextMessage\\\",\\n     \\\"TextMessage\\\": {\\n       \\\"text\\\": \\\"The German healthcare system is based on mandatory insurance. There are two types: public (gesetzliche Krankenversicherung) and private (private Krankenversicherung). As an employed expat, you\'ll typically be enrolled in public insurance, where premiums are based on your income. Your employer will cover half of the premium. To get started, choose a public insurance provider (Krankenkasse) and submit your registration through your employer.\\\"\\n     }\\n   }\\n\\n2. DetailCard\\n   Use for: Structured overviews, introducing topics, or summarizing key points\\n   Example Query: \\\"What documents do I need for Anmeldung?\\\"\\n   Response:\\n   {\\n     \\\"type\\\": \\\"DetailCard\\\",\\n     \\\"DetailCard\\\": {\\n       \\\"title\\\": \\\"Anmeldung Document Checklist\\\",\\n       \\\"subtitle\\\": \\\"Required Documents for Address Registration\\\",\\n       \\\"description\\\": \\\"Essential paperwork needed for registering your address at the Bürgeramt\\\"\\n     }\\n   }\\n\\n3. EmailCard\\n   Use for: Email templates, official correspondence, formal communications\\n   Example Query: \\\"How do I write an email to schedule a viewing for an apartment?\\\"\\n   Response:\\n   {\\n     \\\"type\\\": \\\"EmailCard\\\",\\n     \\\"EmailCard\\\": {\\n       \\\"toEmail\\\": \\\"vermieter@example.de\\\",\\n       \\\"subject\\\": \\\"Wohnungsbesichtigung Anfrage - [Street Address]\\\",\\n       \\\"text\\\": \\\"Sehr geehrte Damen und Herren,\\\\n\\\\nIch interessiere mich sehr für Ihre Wohnungsanzeige in [Location]. Ich würde die Wohnung gerne besichtigen.\\\\n\\\\nIch bin berufstätig als [Profession] bei [Company] und suche eine langfristige Mietwohnung.\\\\n\\\\nIch freue mich auf Ihre Antwort.\\\\n\\\\nMit freundlichen Grüßen\\\\n[Name]\\\"\\n     }\\n   }\\n\\n4. SingleActionCard\\n   Use for: Time-sensitive tasks, important deadlines, required actions\\n   Example Query: \\\"When should I register my address after moving?\\\"\\n   Response:\\n   {\\n     \\\"type\\\": \\\"SingleActionCard\\\",\\n     \\\"SingleActionCard\\\": {\\n       \\\"title\\\": \\\"Address Registration Required\\\",\\n       \\\"description\\\": \\\"You must register your new address within 14 days of moving to your new home in Germany\\\",\\n       \\\"actionTitle\\\": \\\"Book Anmeldung Appointment\\\"\\n     }\\n   }\\n\\n5. BannerCard\\n   Use for: Quick tips, cultural insights, important reminders. Use when you want to highlight something to the user or they ask for a tip.\\n   Example Query: \\\"Any tips for learning German?\\\"\\n   Response:\\n   {\\n     \\\"type\\\": \\\"BannerCard\\\",\\n     \\\"BannerCard\\\": {\\n       \\\"description\\\": \\\"Practice German daily using language apps, watch German TV with subtitles, and try to speak with locals whenever possible\\\",\\n       \\\"label\\\": \\\"Daily German Practice Tips\\\"\\n     }\\n   }\\n\\nSpecial Feature Examples:\\n\\n1. Image Analysis\\n   User: *sends photo of German form*\\n   Response:\\n   {\\n     \\\"type\\\": \\\"TextMessage\\\",\\n     \\\"TextMessage\\\": {\\n       \\\"text\\\": \\\"This is a Mietvertrag (rental contract). The highlighted section on page 1 shows the monthly rent (Kaltmiete) of €800 and additional costs (Nebenkosten) of €200. The security deposit (Kaution) required is €2400, equivalent to three months\' rent.\\\"\\n     }\\n   }\\n\\n2. Audio Analysis\\n   User: *sends audio clip of German pronunciation*\\n   Response:\\n   {\\n     \\\"type\\\": \\\"TextMessage\\\",\\n     \\\"TextMessage\\\": {\\n       \\\"text\\\": \\\"In your pronunciation of \'Entschuldigung\', you\'re placing too much emphasis on the \'schul\' syllable. Try breaking it down: Ent-shul-di-gung, with more emphasis on \'Ent\' and letting the other syllables flow naturally.\\\"\\n     }\\n   }\\n\\nGuidelines:\\n1. Always provide accurate, up-to-date information\\n2. Include disclaimers when discussing legal or medical topics\\n3. Maintain a helpful, encouraging tone\\n4. Use the most appropriate response format for the context\\n5. When analyzing images or audio, be specific about what you observe\\n6. Provide actionable next steps when possible\\n\\nRemember: Your responses should be practical, clear, and tailored to the expat experience in Germany.\",\"agentName\":\"Agent\",\"agentProfilePicture\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/g-p-t-4o-gwizk5/assets/ij7c0yekmnfb/Logo_Glass.png\"}'));
  ModelConfigurationStruct get ModelConfiguration => _ModelConfiguration;
  set ModelConfiguration(ModelConfigurationStruct value) {
    _ModelConfiguration = value;
  }

  void updateModelConfigurationStruct(
      Function(ModelConfigurationStruct) updateFn) {
    updateFn(_ModelConfiguration);
  }

  UserProfileStruct _UserProfile = UserProfileStruct.fromSerializableMap(jsonDecode(
      '{\"username\":\"Sarah\",\"profilePicture\":\"https://images.pexels.com/photos/720598/pexels-photo-720598.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2\"}'));
  UserProfileStruct get UserProfile => _UserProfile;
  set UserProfile(UserProfileStruct value) {
    _UserProfile = value;
  }

  void updateUserProfileStruct(Function(UserProfileStruct) updateFn) {
    updateFn(_UserProfile);
  }

  dynamic _GeminiResponseSchema = jsonDecode(
      '{\"type\":\"object\",\"properties\":{\"type\":{\"type\":\"string\",\"enum\":[\"TextMessage\",\"DetailCard\",\"EmailCard\",\"SingleActionCard\",\"BannerCard\"],\"description\":\"Type of the response message\"},\"TextMessage\":{\"type\":\"object\",\"properties\":{\"text\":{\"type\":\"string\",\"description\":\"A plain text response for detailed explanations, limited to 10 sentences\"}},\"required\":[\"text\"]},\"DetailCard\":{\"type\":\"object\",\"properties\":{\"title\":{\"type\":\"string\",\"description\":\"Main topic or subject\"},\"subtitle\":{\"type\":\"string\",\"description\":\"Supporting context or category\"},\"description\":{\"type\":\"string\",\"description\":\"Brief overview or summary\"}},\"required\":[\"title\",\"subtitle\",\"description\"]},\"EmailCard\":{\"type\":\"object\",\"properties\":{\"toEmail\":{\"type\":\"string\",\"description\":\"Recipient email address\"},\"subject\":{\"type\":\"string\",\"description\":\"Email subject line\"},\"text\":{\"type\":\"string\",\"description\":\"Email body content\"}},\"required\":[\"toEmail\",\"subject\",\"text\"]},\"SingleActionCard\":{\"type\":\"object\",\"properties\":{\"title\":{\"type\":\"string\",\"description\":\"Action title or header\"},\"description\":{\"type\":\"string\",\"description\":\"Details about the required action\"},\"actionTitle\":{\"type\":\"string\",\"description\":\"Call-to-action button text\"}},\"required\":[\"title\",\"description\",\"actionTitle\"]},\"BannerCard\":{\"type\":\"object\",\"properties\":{\"description\":{\"type\":\"string\",\"description\":\"Brief tip or important reminder\"},\"label\":{\"type\":\"string\",\"description\":\"Short summary label (max 4 words)\"}},\"required\":[\"description\",\"label\"]}},\"required\":[\"type\"],\"description\":\"A structured response format for the German expatriate assistant\"}');
  dynamic get GeminiResponseSchema => _GeminiResponseSchema;
  set GeminiResponseSchema(dynamic value) {
    _GeminiResponseSchema = value;
  }
}

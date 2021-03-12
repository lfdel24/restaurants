import 'package:supabase/supabase.dart';

class Database {
  final supabaseUrl = 'https://scymdokbleqmjncyglyy.supabase.co';
  final supabaseKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTYxNTU2OTI3MSwiZXhwIjoxOTMxMTQ1MjcxfQ.wTc2YdosfDwASn87MnkEU3ILFPoK0-vJvhaSZccwRDA';

  SupabaseClient getSupabaseClient() {
    return SupabaseClient(supabaseUrl, supabaseKey);
  }
}

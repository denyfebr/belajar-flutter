import 'package:flutter/material.dart';

class ProfileSettingsPage extends StatefulWidget {
  @override
  _ProfileSettingsPageState createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
  bool darkMode = false;
  bool onlyWifi = true;
  bool playInBackground = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 40),
              color: Colors.white,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      "https://media.licdn.com/dms/image/v2/D5603AQEeWCUN69ngRw/profile-displayphoto-shrink_800_800/profile-displayphoto-shrink_800_800/0/1723855047571?e=1766016000&v=beta&t=zS5LoMbqhT4NowyIF66LAKLIzL097cZ7sU7Q9nch7Mc",
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Deny Febriyanto",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "denyfebri@gmail.com",
                    style: TextStyle(color: Colors.red),
                  ),
                  SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: StadiumBorder(),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("Edit Profile",style: TextStyle(color: Colors.white),),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 15),

            // ---- CONTENT SECTION ----
            _buildSectionTitle("CONTENT"),

            _buildNavigationTile(
              icon: Icons.favorite_border,
              title: "Favorites",
            ),
            _buildNavigationTile(
              icon: Icons.download_outlined,
              title: "Downloads",
            ),

            SizedBox(height: 10),

            // ---- PREFERENCES SECTION ----
            _buildSectionTitle("PREFERENCES"),

            _buildNavigationTile(
              icon: Icons.language,
              title: "Language",
              trailing: Text("English"),
            ),

            // Dark Mode switch
            _buildSwitchTile(
              icon: Icons.dark_mode_outlined,
              title: "Dark Mode",
              value: darkMode,
              onChanged: (val) {
                setState(() => darkMode = val);
              },
            ),

            // Only download via WiFi
            _buildSwitchTile(
              icon: Icons.wifi,
              title: "Only Download via Wi-Fi",
              value: onlyWifi,
              onChanged: (val) {
                setState(() => onlyWifi = val);
              },
            ),

            // Play in Background
            _buildSwitchTile(
              icon: Icons.play_circle_outline,
              title: "Play in Background",
              value: playInBackground,
              onChanged: (val) {
                setState(() => playInBackground = val);
              },
            ),

            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // Section title
  Widget _buildSectionTitle(String title) {
    return Container(
      width: double.infinity,
      color: Colors.red[500],
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),
      ),
    );
  }

  // Navigation list tile
  Widget _buildNavigationTile(
      {required IconData icon, required String title, Widget? trailing}) {
    return Container(
      color: Colors.white,
      child: ListTile(
        leading: Icon(icon, color: Colors.black87),
        title: Text(title),
        trailing: trailing ?? Icon(Icons.chevron_right),
        onTap: () {},
      ),
    );
  }

  // Switch tile
  Widget _buildSwitchTile({
    required IconData icon,
    required String title,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Container(
      color: Colors.white,
      child: SwitchListTile(
        value: value,
        onChanged: onChanged,
        title: Text(title),
        secondary: Icon(icon),

        // 👉 warna saat aktif
        activeColor: Colors.white, // warna bulat (thumb)
        activeTrackColor: Colors.red, // warna jalur

        // 👉 warna saat nonaktif
        inactiveThumbColor: Colors.grey,
        inactiveTrackColor: Colors.black26,

      ),
    );
  }
}

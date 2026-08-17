import 'package:flutter/material.dart';

class AccountSubscreen extends StatelessWidget {
  const AccountSubscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // profile card
        Container(
          child: Stack(
            children: [
              Container(
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              //  ini untuk card profile
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
                child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        // gambar, nama, jabatan, angka
                        Row(
                          children: [
                            //gambar profil
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                "https://media.licdn.com/dms/image/v2/D5603AQEeWCUN69ngRw/profile-displayphoto-shrink_800_800/profile-displayphoto-shrink_800_800/0/1723855047571?e=1766016000&v=beta&t=zS5LoMbqhT4NowyIF66LAKLIzL097cZ7sU7Q9nch7Mc",
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 10),
                            // expanded :  mengambil semua space dala satu widget parent Row()
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Deny Febriyanto",
                                    style: Theme.of(
                                      context,
                                    ).textTheme.headlineSmall,
                                  ),
                                  Text("Fullstack Developer"),
                                  Card(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8.0,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Following",
                                                style: Theme.of(
                                                  context,
                                                ).textTheme.bodySmall,
                                              ),
                                              Text(
                                                "100",
                                                style: Theme.of(
                                                  context,
                                                ).textTheme.bodyLarge,
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Articles",
                                                style: Theme.of(
                                                  context,
                                                ).textTheme.bodySmall,
                                              ),
                                              Text(
                                                "100",
                                                style: Theme.of(
                                                  context,
                                                ).textTheme.bodyLarge,
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Rating",
                                                style: Theme.of(
                                                  context,
                                                ).textTheme.bodySmall,
                                              ),
                                              Text(
                                                "4.5",
                                                style: Theme.of(
                                                  context,
                                                ).textTheme.bodyLarge,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        // tombol chat dan follow
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {},
                                child: Text("Chat"),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text("Follow"),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        // list article
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            "List Article",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),

        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) => Container(
              margin: EdgeInsets.only(left: 10),
              width: 200,
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      "https://ecolodgesindonesia.com/wp-content/uploads/2020/09/1-2.jpg",
                    ),
                    Text(
                      "Category",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      "Judul",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        // favorite article
        Container(
          margin: EdgeInsets.only(top: 10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                color: Colors.blueGrey.shade700,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Favorite Article",
                    // copyWith = menimpa value yang sudah ada dengan value baru
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Apakah berbeda antara Yogya dan Jogja",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ],
    );
  }
}

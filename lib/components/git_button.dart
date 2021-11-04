import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class GitButton extends StatelessWidget {
  final String label;
  final String github;

  const GitButton(this.label, this.github, {Key? key}) : super(key: key);

  _launchURL() async {
    String url = 'https://github.com/' + github;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: SizedBox(
        width: 350,
        height: 70,
        child: ElevatedButton(
          onPressed: _launchURL,
          child: Container(
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                Image.network(
                  "https://icon-library.com/images/github-icon-white/github-icon-white-6.jpg",
                  scale: 2,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: Text(
                    label,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),
          style: ButtonStyle(
            shape: MaterialStateProperty.all<BeveledRectangleBorder>(
              BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
                side: const BorderSide(color: Colors.white),
              ),
            ),
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.green.shade400),
            elevation: MaterialStateProperty.all(5),
            fixedSize:
                MaterialStateProperty.all<Size>(const Size.fromWidth(300)),
          ),
        ),
      ),
    );
  }
}

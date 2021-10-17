part of AppConfig;

class ButtonStyles {
  static final ButtonStyle blueRounded = ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Color(0x246CFE)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
              side: BorderSide(color: Color(0x246CFE)))));

  static final ButtonStyle imageRounded = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Color(0x181A1F)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
              side: BorderSide(color: Color(0x666A7A), width: 1))));
}

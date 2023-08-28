String convertDate(String theDate) {
  String dateConvert = "";
  if(theDate.isNotEmpty){
    DateTime dt = DateTime.parse(theDate);

  
  String mois = "";
  String jour = dt.day.toString();
  if (jour.length < 2) {
    jour = "0$jour";
  }

  String annee = dt.year.toString();

  mois = [
    "Janvier",
    "Février",
    "Mars",
    "Avril",
    "Mai",
    "Juin",
    "Juillet",
    "Aout",
    "Septembre",
    "Octobre",
    "Novembre",
    "Décembre"
  ][dt.month - 1];

  dateConvert = "$jour $mois $annee";
  }
  
  return dateConvert;
}
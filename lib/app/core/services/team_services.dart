class TeamServices {
  TeamServices._();

  static String teamName(String code) {
    Map<String, String> teams = {
      "QA": "Qatar",
      "EC": "Equador",
      "SN": "Senegal",
      "NL": "Holanda",
      "GB-ENG": "Inglaterra",
      "IR": "Irã",
      "US": "Estados Unidos",
      "GB-WLS": "País de Gales",
      "AR": "Argentina",
      "SA": "Arábia Saudita",
      "MX": "México",
      "PL": "Polônia",
      "FR": "França",
      "AU": "Austrália",
      "DK": "Dinamarca",
      "TN": "Tunísia",
      "ES": "Espanha",
      "CR": "Costa Rica",
      "DE": "Alemanha",
      "JP": "Japão",
      "BE": "Bélgica",
      "CA": "Canadá",
      "MA": "Marrocos",
      "HR": "Croácia",
      "BR": "Brasil",
      "RS": "Sérvia",
      "CH": "Suíça",
      "CM": "Camarões",
      "PT": "Portugal",
      "GH": "Gana",
      "UY": "Uruguai",
      "KR": "Coréia do Sul"
    };

    if (!teams.keys.contains(code)) {
      return code;
    }

    String nameOfTeam = teams[code]!;
    return nameOfTeam;
  }
}

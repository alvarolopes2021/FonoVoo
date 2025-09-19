class GetCategoryExpalanation {
  static String categoryToExplanation(String category) {
    String explanation = "";
    switch (category) {
      case "frases":
        explanation =
            "Consciência de palavras também pode ser entendido como  consciência fonológica, definido como sendo a noção de que as palavras são constituídas por diversos sons ou grupos de sons que podem ser segmentadas em unidades menores. \n(EF01LP08) Relacionar elementos sonoros (sílabas, fonemas, partes de palavras) com sua representação escrita.";
        break;
      case "rimas":
        explanation =
            "A rima é um dos principais recursos para explorar a sonoridade das palavras num poema, é a repetição regular dos mesmos sons ou de sons parecidos, ela  facilita o caminho para a criança chegar até a consciência fonêmica, fundamental para estabelecer a relação entre fonemas e grafemas, aspecto essencial para o processo de aquisição de leitura e escrita \n(EF12LP19) Reconhecer, em textos diversificados, rimas, sonoridades, jogos de palavras, palavras, expressões, comparações, relacionando-as com sensações e associações.";
        break;
      case "parlendas":
        explanation =
            "As  parlendas podem ser utilizadas de maneiras variadas, como a exploração oral, rítmica, auditiva, o conhecimento cultural, a socialização através dos jogos cantados, a exploração da compreensão do sistema escrito, as aptidões artísticas. \n(EF01LP1)Recitar parlendas, quadras, quadrinhas, trava-línguas, com entonação adequada e observando as rimas. ";
        break;
      case "silabas":
        explanation =
            "A sílaba é uma unidade sonora da língua maior do que o som é menor do que a palavra. Dito de outra forma, as sílabas são constituídas por sons e constituem as palavras. \n(EF01LP07) Identificar fonemas e sua representação por letras.";
        break;
    }
    return explanation;
  }
}

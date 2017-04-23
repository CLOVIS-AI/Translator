class Translator{
  
  private HashMap<String, String> lines;
  
  /**
   * Creates a Translator object, holding data about a specific languages'
   * translation.
   * @param language name of the language you want to load.<br/>
   *                 The <code>language</code> is used to select the file,
   *                 using the pattern <code>LANGUAGE.xml</code>, and should
   *                 be placed inside the folder : <code>data/languages</code>.
   */
  Translator(String language){
    println("Loading language ...");
    XML content = loadXML("languages/" + language.toUpperCase() + ".xml");
    println("File successfully loaded.");
    this.lines = new HashMap();
    XML[] lines = content.getChildren("line");
    println("Analyzing content ...");
    for(XML line : lines){
      String id = line.getString("id");
      String translation = line.getContent();
      println("Found line '" + id + "', translated as {" + translation + "}");
      this.lines.put(id, translation);
    }
    println("Content analyzed.");
    println("Job finished.");
  }
  
  /**
   * Gets the translation of a specific line.
   * @param id the name of the line, as it is written in the XML file.
   * @returns The translation if present in the file. If there's no translation available, returns <code>id</code>.
   */
  String ln(String id){
    String ret = lines.get(id);
    if(ret == null || ret.equals("."))
      return id;
    return ret;
  }
}

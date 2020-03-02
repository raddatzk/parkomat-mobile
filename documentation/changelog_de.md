### Version 2.0
Diese Version bietet nicht viele sichtbare neue Funktionen, sondern bringt einige wichtige **interne** Änderungen mit sich.

**UI**:
* Das Änderungsprotokoll ist jetzt ein eigener Bildschirm mit einer leichteren Lesbarkeit, anstelle der alten Informationsleiste, die am unteren Rand des Bildschirms eingeblendet wurde.
* Der Netzwerkverbindungsindikator wurde aktualisiert, um schneller auf Netzwerkänderungen reagieren zu können.
* Updates der App werden direkt durch den Play Store bzw. App Store durchgeführt. 
  **Mit diesem Update überprüft die App nicht mehr ob eine neue Version verfügbar ist.**  

**Internes**: 
* Das Änderungsprotokoll unterstützt nun die Markdown Syntax und wird nicht mehr von den Github Servern geladen, sondern wird der App direkt beigelegt.
* Die App verwendet nun den neuen Health Endpunkt im Parkomat-Backend, um die Verbindung zu überprüfen.
  Frühere Versionen haben die volle Parkplatzsituation abgerufen, was zu wesentlich mehr Netzwerkverkehr führte.

**Sonstiges**:
* Der Quellcode wurde deutlich aufgeräumt.
* Es gab ganz sicher einige Fehler, die jetzt natürlich alle behoben sind ;) 

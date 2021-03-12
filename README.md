# tuwien-compilerbau-test-21

Kooperative Sammlung von Testfällen für die LVA "Übersetzerbau" der TU Wien im SS21.

Bitte beachtet, dass dies eine kooperative Sammlung sein soll. Ein einzelner Testfall ist schnell geschrieben und
hilft allen weiter.

## Kurze Anleitung für g0:

	$ git clone git://github.com/svchostdotexe/tuwien-compilerbau-test-21.git ~/test

Danach koennen die Testfaelle durch diesen Befehl aktualisiert werden:

	$ cd ~/test && git pull

Das Testskript selbst wird von der LVA-Leitung zur Verfuegung gestellt:

	$ /usr/ftp/pub/ubvl/test/scanner/test
	$ /usr/ftp/pub/ubvl/test/parser/test
	$ /usr/ftp/pub/ubvl/test/ag/test
	$ /usr/ftp/pub/ubvl/test/codea/test
	$ /usr/ftp/pub/ubvl/test/codeb/test
	$ /usr/ftp/pub/ubvl/test/gesamt/test

## Anleitung des LVA-Teams

> Beim Scanner-Beispiel legen Sie für korrekte Eingaben Dateien mit Namen der Form *.0 an, und für die zugehoerigen Ausgaben Dateien mit Namen der Form *.out; für Eingabendateien mit lexikalischen Fehlern legen Sie Dateien mit Namen der Form *.1 an.
>
> FüR das parser- und ag-Beispiel legen Sie Dateien der Form *.[012] bzw. $[0123] an, wobei die Extension angibt, welchen exit-Status parser bzw. ag bei dieser Eingabe liefern sollen. Wenn Sie also eine Datei mit einem Syntax-Fehler anlegen, sollte sie z.B. "test.2" heißen.
>
> Falls sie das Skript für eigene Modifikationen kopieren, beachten Sie, dass sie es nicht mit "test" aufrufen koennen, aber z.B. mit "./test" geht es; in der Shell gibt es einen eingebauten Befehl "test".
>
> Auch wenn Sie Ihr Programm zu Hause schon getestet haben, sollten Sie die Tests auf jeden Fall auf unseren Übungsservern wiederholen, um Fehler bei der Übertragung abzufangen.

## Zusätzliche Namenskonvention

Bitte Testdaten mit Username/Pseudonym versehen, damit es keine Konflikte gibt.
> {name}-{nummer}.{type}  
> svchostdotexe-1.out
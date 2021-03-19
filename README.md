# tuwien-compilerbau-test-21

Kooperative Sammlung von Testfällen für die LVA "Übersetzerbau" der TU Wien im SS21.

Bitte beachtet, dass dies eine kooperative Sammlung sein soll. Ein einzelner Testfall ist schnell geschrieben und hilft
allen weiter.

## Kurze Anleitung für g0

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

# ASMB Benchmark Tool

Das Benchmarktool wurde aus den Vorjahren übernommen und angepasst.  
Credits: mr. ubvl  

Instructions:  
1. pull repo
2.      $ ./test.sh
3. Poste deinen Instructioncount ins Forum/Discord/Mattermost.  

Das Benchmarktool überprüft nicht die Korrektheit des Programms! Stellt das selbst via LVA-Testprogramm sicher.


# ASMA Testcase generator

## WARNING

> Mittels make clean soll man alle von Werkzeugen erzeugten Dateien löschen können

Beachtet, dass die zusätzliche Datei eventuell zu einem Punkteabzug führen kann. Löscht sie vor der Abgabe oder entfernt
sie via makefile!

#### Created by KingD

To generate the testcases you simply have to run the script `testgenerator.sh`. After the script is finished it will
create a file called `main.c`. Simply copy that file and paste it where your `amsa.o` `Makefile` etc is and
run `/usr/ftp/pub/ubvl/test/asma/test`. Have fun!

## Adding more testcases

If you want to add more testcases created a new file in `testcases` and add your test method. The method the programm
hast to call to perform the test to return an int. This int represents the number of testcases that failed!
The first line of the file has to be the method definition. As an example you can look at the example testcase in the
file `./testcases/example-testcase.c`
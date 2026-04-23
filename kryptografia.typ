#set document(
  title: [Kryptografia],
)

#set page(
  paper: "a4",
  margin: (x: 1.8cm, y: 1.5cm),
  numbering: "1/1",
  columns: 2,
)
#set text(
  font: "New Computer Modern",
  size: 12pt,
)
#set par(
  justify: true,
  leading: 0.52em,
)
#set heading(
  numbering: "1.",
)

#place(
  top + center,
  float: true,
  scope: "parent",
  clearance: 2em
)[
  #title()
  Mateusz Smuga \ 
  22.04.2026
]

= Kryptologia
Kryptologia to nauka o bezpiecznej komunikacji i łamaniu zabezpieczeń. Dzieli się na dwie gałęzie:

- Kryptografie (tworzenie zabezpieczeń)
- Kryptoanalizę (testowanie i łamanie zabezpieczeń)

== Podstawowe Pojęcia
*Tekst Jawny (plaintext)* – oryginalna wiadomość, którą każdy może przeczytać \
*Szyfrogram (ciphertext)* – wynik szyfrowania, wygląda jak losowy ciąg znaków
*Szyfrowanie (encryption)* – proces zamiany tekstu jawnego na szyfrogram przy użyciu algorytmu i klucza \
*Deszyfrowanie (decryption)* – proces odwrotny do szyfrowania, przywraccanie czystej formy tekstu \
*Algorytm (cipher)* – instrukcja jak przestawić bity / litery \
*Klucz (key)* – unikalny parametr, znając algorytm, bez klucza nie da się odszyfrować informacji \
*Przestrzeń kluczy (key space)* to zbiór wszystkich możliwych kluczy, których możemy użyć, zazwyczaj oznaczany $cal(K)$ \
*Przestrzeń szyfrogramów (ciphertext space)* to zbiór wszystkich możliwych szyfrogramów jakie mogą powstać, oznaczamy $cal(C)$. \ 
*Przestrzeń tekstu jawnego (plaintext space)* – oznaczana zazwyczaj symbolem $cal(P)$, to zbiór wszystkich dopuszczalnych komunikatów, które mogą zostać poddane procesowi szyfrowania w danym systemie.
= Rodzaje Szyfrowania
== Szyfrowanie Symetryczne
Używamy tego samego klucza do szyfrowania i deszyfrowania, jest bardzo szybkie, ale problemem jest przekazanie w bezpieczny sposób klucza drugiej osobie.

== Szyfrowanie Asymetryczne
Używamy pary kluczy:
- *klucz publiczny* – każdy może go znać, służy do szyfrowania wiadomości dla odbiorcy
- *klucz prywatny* – zna go jedynie odbiorca, służy do deszyfrowania wiadomości od innych


= Zasada Kerckhoffsa
System kryptograficzny powinien być bezpieczny, nawet jeśli wszystko w nim (poza kluczem) jest jawne i znane przeciwnikowi.

= Wiadomość
*Wiadomość (message)* to pojedynczy element danych, który chcemy przesłać w bezpieczny sposób jest to ciąg bitów, zazwyczaj oznaczamy $m$.

*Przestrzeń wiadomości (message space)* to zbiór wszystkich możliwych wiadomości, jakie mogą zostać wygenerowane i przesłane, oznaczamy symbolem $cal(M)$.

== Wiadomość vs. Tekst Jawny
Wiadomość to pojęcie bardziej abstrakcyjne i semantyczne niż tekst jawny, to informacja, którą nadawca chce przekazać odbiorcy, nie poddana obróbce technicznej. Natomiast tekst jawny to wiadomość, która została już przygotowana do procesu szyfrowania np. sformatowana.

= Sekret
Sekret to wartość z przestrzeni kluczy, posiadana jedynie przez uprawnione strony komunikacji.

== Rodzaje Sekretów
- *Sekret współdzielony (shared secret)* – występuje w kryptografii symetrycznej. Obie strony mają dokładnie tę samą informację. Jeśli sekret wycieknie od jednej osoby, cała komunikacja przestaje być bezpieczna.

- *Klucz prywatny (private key)* – kryptografii asymetrycznej sekret jest tylko po jednej stronie. Druga strona używa klucza publicznego, który nie jest sekretem. 

– *Sekret efemeryczny (ephemeral secret)* – To "sekret jednorazowy", generowany tylko na potrzeby jednej sesji. Po zakończeniu połączenia jest niszczony.

W najprostszym ujęciu kodowanie to proces zamiany informacji z jednej formy na inną według ściśle określonego, publicznie znanego schematu.

Bardzo ważne jest rozróżnienie: kodowanie to nie szyfrowanie. Celem kodowania nie jest ukrycie treści przed adwersarzem, ale sprawienie, by dane były zrozumiałe dla maszyn, odporne na błędy lub łatwiejsze w transmisji.

= Pojęcia Matematyczne
== Funkcja Zaniedbywalna
Funkcję $f(n)$ nazywamy zaniedbywalną, jeśli dla każdego dodatniego wielomianu $p(n)$ istnieje taka liczba  $n_0$, że dla wszystkich $n > n_0$ zachodzi:
$
f(n) < 1/p(n)
$

Np. $f(n) = 1/(2^n)$ jest zaniedbywalna.

== Algorytm Adwersarza
To algorytm probabilistyczny (może podejmować decyzje na podstawie rzutu monetą), o wielomianowym czasie pracy (względem parametru bezpieczeństwa).

= Konstrukcja
To najbardziej podstawowy poziom. Konstrukcja to matematyczny sposób, w jaki budujemy bardziej złożone narzędzie z prostszych elementów.
= Schemat
Schemat to kompletny opis funkcjonalny konkretnego mechanizmu kryptograficznego. Definiuje on zestaw algorytmów, które razem realizują określone zadanie (np. szyfrowanie lub podpis).
Schemat zazwyczaj składa się z trzech algorytmów:
+ Gen: Algorytm generowania kluczy.
+ Enc / Sig: Algorytm szyfrowania lub podpisywania.
+ Dec / Ver: Algorytm deszyfrowania lub weryfikacji.
= Protokół
Protokół to najwyższy poziom abstrakcji. To zbiór reguł określający, jak dwie lub więcej stron (np. klient i serwer) mają ze sobą rozmawiać, używając schematów i konstrukcji, aby bezpiecznie przeprowadzić operację.

= Haszowanie
== Funkcja Skrótu
Rodziną funkcji skrótu nazywamy zbiór $cal(H) = { h_k : cal(D) -> cal(R) }$, gdzie dla każdej funkcji spełnione są następujące warunki:
+ Parametryzacja \ Istnieje skończona przestrzeń kluczy $cal(K)$. Każdy klucz definiuję konkretną funkcję $h_k in cal(H)$.
+ Domena i Przeciwdziedzina \ Domena jest zbiorem ciągów dowolnej długości, np. ${0,1}^*$. Natomiast przeciwdziedzina jest zbiorem ciągów o stałej długości $n(k)$, np. ${0,1}^n$.
+ Efektywność \
Istnieje deterministyczny algorytm o złożoności wielomianowej, który dla każdego klucz $k$ i ciągu wejściowego $x$ oblicza $h_k (x)$.
+ Bezpieczeństwo \
Mówimy, że rodzina funkcji skrótu jest odporna na kolizje, jeśli dla każdego algorytmu adwersarza $A$, prawdopodobieństwo sukcesu w poniższym eksperymencie jest funkcją zaniedbywalną:
1. Wybieramy losowo klucz $k$ \
2. Adwersarz $A$ otrzymuje klucz $k$ \
3. Adwersarz $A$ zwraca parę $x, x'$ \ 
4. Adwersarz *wygrywa* jeśli $x != x'$ oraz $h_k (x) = h_k (x')$ \ 
Wynik działania funkcji skrótu nazywamy *haszem*, funkcję skrótu nazywamy inaczej też funkcją haszującą.

= Transkrypt
*Transkrypt* to kompletny, uporządkowany zapis wiadomości, jakie zostały wymienione między stronami protokołu.

= Protokoły Interaktywne
Protokoły interaktywne to klasa protokołów komunikacyjnych, w których dwie strony – Dowodzący (Prover) oraz Weryfikator (Verifier) – wymieniają między sobą serię wiadomości, aby ustalić prawdziwość pewnego stwierdzenia.

W protokole interaktywnym Weryfikator "testuje" Dowodzącego, zadając mu losowe pytania (wyzwania). Jeśli Dowodzący rzeczywiście posiada wiedzę, o której twierdzi, będzie w stanie odpowiedzieć poprawnie na każde, nawet najbardziej nieprawdopodobne pytanie.

Typowy przebieg (tzw. Σ-protokół) wygląda tak:

+ Zobowiązanie (Commitment): Dowodzący wysyła pierwszą wiadomość, "wiążąc się" z pewną losowością.

+ Wyzwanie (Challenge): Weryfikator wysyła losową wartość (rzut monetą).

+ Odpowiedź (Response): Dowodzący wysyła dowód łączący jego sekret, losowość i wyzwanie.

== Warunek Akceptacji
Jest to konkretne równanie matematyczne lub zbiór reguł, które muszą zostać spełnione na samym końcu procesu weryfikacji.

= Wartość Efemeryczna
Wartość efemeryczna (ang. ephemeral) to w kryptografii i informatyce informacja, która jest tymczasowa i trzymana w pamięci tylko na potrzeby jednej, konkretnej operacji lub sesji komunikacyjnej. Po jej zakończeniu wartość ta jest bezpowrotnie niszczona.


= Klasyczny Schemat Schnorr'a
== Parametry
- $p$ – duża liczba pierwsza
- $q$ – rząd grupy
- $g$ – generator grupy
- $x$ – klucz prywatny
- $y = g^x mod p$ – klucz publiczny

== Protokół Interaktywny
To klasyczny dialog między Dowodzącym a Weryfikatorem. \
Cel: Prover chce udowodnić, że zna $x$, nie pokazując go. \
+ Zobowiązanie (Commitment): P wybiera losową wartość efemeryczną $r$ i wysyła $t = g^r mod p$.
+ Wyzwanie (Challenge): V wysyła losową liczbę c.
+ Odpowiedź (Response) P oblicza $s = r + c dot x mod q$ i wysyła ją do V.
+ Weryfikacja i Warunek akceptacji: V sprawdz czy:
$
g^s = t dot y^c mod p
$
Jeśli równość zachodzi, weryfikator ma pewność, że P zna sekret.

== Protokół Nieinteraktywny
Aby zamienić ten dialog w podpis pod dokumentem (który każdy może zweryfikować bez udziału autora), stosuje się heurystykę Fiata-Shamira. Rolę Weryfikatora i jego losowego wyzwania przejmuje funkcja skrótu (Hash).

=== Podpisywanie wiadomości $M$:
+ Wybierz losowe $r$, obliczz $t = g^r$.
+ Zamiast czekać na wyzwanie, oblicz $c = H(M || t)$
+ Oblicz $s = r+c dot x$
+ Podpisem jest para $(c,s)$ lub $(t,s)$.

=== Weryfikacja Podpisu
Weryfikator mając wiadomość $M$, klucz publiczny $y$ oraz podpis $(c,s)$:
+ Odtwarza zobowiązanie $t' = g^s dot y ^(-c)$.
+ Sprawdza warunek akceptacji: czy $c = H(M||t')$


= Dowód Wiedzy
Dowód wiedzy (ang. Proof of Knowledge) to specyficzny rodzaj protokołu kryptograficznego, w którym jedna strona (Dowodzący) przekonuje drugą stronę (Weryfikatora), że nie tylko dane stwierdzenie jest prawdziwe, ale że on sam faktycznie posiada (zna) konkretną informację (sekret), która to potwierdza.

= Podpis
Podpis to dowód wiedzy o kluczu prywatnym, który został "przyklejony" do wiadomości.

= Pełność i Poprawność
*Pełność* gwarantuje, że jeśli twierdzenie jest prawdziwe i Dowodzący zna sekret, to zawsze uda mu się przekonać Weryfikatora.
*Poprawność* gwarantuje, że jeśli twierdzenie jest fałszywe (lub Dowodzący nie zna sekretu), to nie uda mu się przekonać Weryfikatora.

= Ataki
W kryptografii atak to każde celowe działanie podjęte przez stronę trzecią (Adwersarza), którego celem jest naruszenie co najmniej jednego z filarów bezpieczeństwa systemu: poufności, integralności lub autentyczności.

== Podsłuch (Passive Attack)
Atakujący jedynie obserwuje transkrypty (zapisy rozmów) między Dowodzącym a Weryfikatorem. Próbuje z nich wywnioskować klucz prywatny.

== Atak aktywny (Active Attack) 
Atakujący może modyfikować wiadomości, wysyłać własne wyzwania lub udawać weryfikatora, aby wyciągnąć informacje od użytkownika.

== Podszycie (Impersonation)
To atak na tożsamość. Celem adwersarza jest przekonanie Weryfikatora, że jest on uprawnionym użytkownikiem (właścicielem konkretnego klucza publicznego).

== Fałszerstwo (Forgery)
To atak na dokument (podpis). Celem adwersarza jest stworzenie poprawnej pary (Wiadomość, Podpis) bez znajomości klucza prywatnego.

= Rzetelność
Rzetelność to cecha protokołu, która gwarantuje, że nie można dowieść fałszywego twierdzenia. To "uczciwość" dowodu wobec Weryfikatora.

Prawdopodobieństwo, że Weryfikator zaakceptuje dowód dla fałszywego twierdzenia (lub gdy Dowodzący nie zna sekretu), jest zaniedbywalne.

= Bezpieczeństwo
Bezpieczeństwo to pojęcie nadrzędne. Nie odnosi się tylko do jednego równania, ale do odporności całego schematu na wszelkie znane i nieznane ataki w określonym modelu.

System uznaje się za bezpieczny, gdy spełnia trzy główne warunki (tzw. triada CIA, a w protokołach wiedzy – warunki dowodu):

- Poufność / Wiedza Zerowa: Atakujący nie może wyciągnąć sekretu x z obserwacji protokołu.
- Nienaruszalność (Integralność): Nikt nie może zmienić treści podpisu ani wiadomości bez wykrycia.
- Odporność na ataki (Robustness): System działa poprawnie nawet wtedy, gdy adwersarz aktywnie próbuje go zakłócić.

= Poziom Bezpieczeństwa
Mówimy, że algorytm ma n-bitowy poziom bezpieczeństwa, jeśli najszybszy znany atak na ten algorytm wymaga wykonania średnio 2n operacji.


= Siła Ataku
W kryptografii siła ataku (często utożsamiana z kosztem lub złożonością ataku) to miara zasobów, jakie adwersarz musi poświęcić, aby złamać dany mechanizm.

= Słaby Podzbiór Punktów
To takie punkty (klucze), dla których rozwiązanie problemu matematycznego (znalezienie sekretu) jest znacznie łatwiejsze niż dla przeciętnego, losowego punktu.

= Parowanie Dwuliniowe
Parowanie to funkcja $e$, która bierze dwa elementy z dwóch grup i zwraca element z trzeciej grupy:
$
e: G_1 times G_2 -> G_T
$
Aby funkcja ta była użyteczna w kryptografii, musi spełniać trzy warunki:
+ Dwuliniowość (Bilinearity): Dla dowolnych punktów $P, Q$ i skalarów $a, b$ zachodzi: $
e(a dot P, b dot Q) = e(P, Q)^(a dot b)
$
+ Niezdegenerowanie: $exists P, Q thick e(P,Q) != 1$
+ Obliczalność: Musi istnieć wydajny algorytm, który pozwoli komputerowi szybko obliczyć wynik parowania.

= RSA
RSA (skrót od nazwisk twórców: Rivest, Shamir, Adleman) to pierwszy i najbardziej rozpoznawalny algorytm kryptografii asymetrycznej (z kluczem publicznym). Został zaprezentowany w 1977 roku i do dziś stanowi fundament bezpieczeństwa w Internecie.

Jego potęga opiera się na trudności faktoryzacji, czyli rozkładu dużych liczb na czynniki pierwsze.

== Generowanie Kluczy
+ Wybieramy dwie bardzo dużem losowe liczby pierwsze $p$ oraz $q$.
+ Obliczamy ich iloczyn $n = p dot q$. Liczba $n$ nazywana jest modułem i jest publiczna.
+ Obliczamy funkcję Eulera $phi.alt(n) = (p - 1) dot (q-1)$.
+ Wybieramy liczbę $e$, która jest względnie pierwsza z $phi.alt(n)$.
+ Obliczamy liczbę $d$, która jest odwrotnością $e$ modulo $phi.alt(n)$.
  - klucz publiczny: $(n, e)$
  - klucz prywatny: $d$ oraz $p, q$, które należy zniszczyć

== Szyfrowanie
Jeśli ktoś chce wysłać wiadomość $m$ to zamienia ją na licbę i oblicza szyfrogram $c$:
$
c = m^e mod n
$

== Deszyfrowanie
Znając klucz prywatny można zdeszyfrować:
$
m = c^d mod n
$

= RSA Full Domain Hash
Zamiast podpisywać wiadomość bezpośrednio, RSA-FDH wprowadza funkcję skrótu H, która ma jedną wyjątkową cechę: jej wynik musi być tak samo duży jak moduł n.

== Podpis
+ Wiadomość $m$ przepuszczamy przez funkcję skrótu $H$ otrzymujemy wartość $h = H(m)$ z ${0, dots.h, n - 1}$
+ Obliczamy podpis $s$ przy użyciu klucza prywatnego $d$: $ s = h^d mod n $
== Weryfikacja
Odbiorca dostaje wiadomość $m$ i podpis $s$.

+ Obliczamy $h = H(m)$
+ Używamy klucza publicznego aby odkodować podpis: $ h' = s^e mod n $
+ Sprawdzamy, czy $h' = h$. Jeśli tak, podpis jest autentyczny.

= Krzywe Eliptyczne
Krzywa eliptyczna $E$ nad ciałem skończonym $FF_p$ (gdzie $p > 3$ jest liczbą pierwszą) to zbiór punktów $(x, y)$, które spełniają równanie Weierstrassa:
$
E(FF_p) = {(x, y) in FF_p ^2 : y^2 equiv x^3 + a x +b mod p}
$

Warunki konieczne:
- Wyróżnik: $delta = 4 dot a ^3 + 27 dot b^2 != 0 mod p$. Gwarantuje to, że krzywa nie posiada punktów osobliwych (ostrzy ani samoprzecięć).
- Punkt w nieskończoności: Do zbioru punktów dołączamy specjalny elment $cal(O)$ (tzw. punkt w nieskończoności), który pełni rolę elementu neutralnego grupy.


== Dodawanie
Jeśli mamy dwa punkty $P=(x_1, y_1)$ oraz $Q=(x_2, y_2)$, to ich suma $R = P + Q = (x_3, y_3)$ jest zdefiniowane następująco:
\
Wyznaczanie nachylenia:
Współczynnik nachylenia prostej przechodzącej przez $P$ i $Q$ zależy od tego, czy różne, czy identyczne:

+ Jeśli $P != Q$: $lambda = (y_2 - y_1)/(x_2 - x_1) mod p$
+ Jeśli $P = Q$: $lambda = (3x_1^2 + a)/(2y_1) mod p$
\
Obliczenie współrzędnych punktu $R$: \
$
x_3 = lambda^2 -x_1 -x_2 mod p\
y_3 = lambda dot (x_1 -x_3) - y_1 mod p
$

== Mnożenie przez Skalar
$
k dot P = sum_(i=1)^k P
$

== Rząd punktu i rząd grupy
- rząd grupy $(N)$ – całkowita liczba punktów na krzywej $E(FF_p)$. Zgodnie z twierdzeniem Hassego, $N ~ p + 1$.
- rząd punktu (n) – najmniejsza liczba dodatnia $n$, taka że $n dot P = cal(O)$

== Problem Logarytmu Dyskretnego
Mając dane punkty $P$ oraz $Q = k dot P$, znalezienie skalaru jest niemożliwe dla odpowiednio dużych parametrów.

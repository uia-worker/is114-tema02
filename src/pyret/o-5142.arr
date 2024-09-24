import lists as L

# O-5142
# Med en anonym (lambda) funksjon
# Med en innebygd funksjon "string-to-lower"
# https://pyret.org/docs/latest/strings.html#%28part._strings_string-tolower%29
fun remove-lowercase-words(list-of-words :: List<String>) -> List<String>:
doc: "Tar en liste med ord som INPUT og returnerer en liste med ord uten ord, som inneholder kun småbokstaver."
  L.filter(lam(elt): not(string-to-lower(elt) == elt) end, list-of-words)
where:
  remove-lowercase-words([list: "hello", "I", "Love", "You"]) is [list: "I", "Love", "You"]
end

# O-5142
# Uten den anonyme (lambda) funksjonen (må skrive to funksjoner)
# Med en innebygd funksjon "string-to-lower"
# Lag en streng B fra streng "elt", som kun inneholder småbokstaver
# Sammenligne streng B med "elt", - hvis "true", så er "kun småbokstaver?" "true",
# hvis "false", så er "kun småbokstaver?" "false"
# Man må ta hensyn at funksjonene
fun is-not-all-lowercase(elt :: String) -> Boolean:
doc: "Tar et ord som INPUT og returnerer false, hvis ordet inneholder kun småbokstaver. Returnerer true hvis ordet inneholder kun storbokstaver eller en blanding mellom store og små bokstaver." 
  not(string-to-lower(elt) == elt)
end

fun remove-lowercase-words-another(list-of-words :: List<String>) -> List<String>:
doc: "Tar en liste med ord som INPUT og returnerer en liste med ord uten ord, som inneholder kun småbokstaver."
  L.filter(is-not-all-lowercase, list-of-words)
where:
  remove-lowercase-words-another([list: "hello", "I", "Love", "You"]) is [list: "I", "Love", "You"]
end

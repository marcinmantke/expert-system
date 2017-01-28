Component.create(name: "typ", value: "PC")
Component.create(name: "typ", value: "laptop")
Component.create(name: "typ", value: "ultrabook")
Component.create(name: "typ", value: "All-In-One")

Component.create(name: "grafika", value: "zintegrowana")
Component.create(name: "grafika", value: "dedykowana")

Component.create(name: "CPU", value: "2")
Component.create(name: "CPU", value: "4")

Component.create(name: "RAM", value: "4")
Component.create(name: "RAM", value: "8")
Component.create(name: "RAM", value: "16")

Component.create(name: "naped", value: "brak")
Component.create(name: "naped", value: "CD/DVD")
Component.create(name: "naped", value: "blu-ray")
Component.create(name: "naped", value: "brak")

Component.create(name: "monitor", value: "wbudowany")
Component.create(name: "monitor", value: "normalny")
Component.create(name: "monitor", value: "do grafiki")

Component.create(name: "dysk", value: "SSD")
Component.create(name: "dysk", value: "HDD")

Component.create(name: "USB", value: "2.0")
Component.create(name: "USB", value: "3.0")

Component.create(name: "zlacza", value: "HDMI")
Component.create(name: "zlacza", value: "VGA")
Component.create(name: "zlacza", value: "DisplayPort")
Component.create(name: "zlacza", value: "SD")

Component.create(name: "muzyka", value: "zintegrowana")
Component.create(name: "muzyka", value: "dedykowana")

##############

Rule.create(antedecent: "grafika", consequent: ["dedykowana"], category: "grafika")
Rule.create(antedecent: "grafika", consequent: ["4"], category: "CPU")
Rule.create(antedecent: "grafika", consequent: ["SSD"], category: "dysk")
Rule.create(antedecent: "grafika", consequent: ["HDD"], category: "dysk")
Rule.create(antedecent: "grafika", consequent: ["8"], category: "RAM")
Rule.create(antedecent: "grafika", consequent: ["16"], category: "RAM")
Rule.create(antedecent: "grafika", consequent: ["do grafiki"], category: "monitor")
Rule.create(antedecent: "grafika", consequent: ["3.0"], category: "USB")
Rule.create(antedecent: "grafika", consequent: ["HDMI"], category: "zlacza")
Rule.create(antedecent: "grafika", consequent: ["DisplayPort"], category: "zlacza")
Rule.create(antedecent: "grafika", consequent: ["SD"], category: "zlacza")

Rule.create(antedecent: "muzyka", consequent: ["dedykowana"], category: "muzyka")
Rule.create(antedecent: "muzyka", consequent: ["4"], category: "CPU")
Rule.create(antedecent: "muzyka", consequent: ["SSD"], category: "dysk")
Rule.create(antedecent: "muzyka", consequent: ["HDD"], category: "dysk")
Rule.create(antedecent: "muzyka", consequent: ["8"], category: "RAM")
Rule.create(antedecent: "muzyka", consequent: ["3.0"], category: "USB")
Rule.create(antedecent: "muzyka", consequent: ["HDMI"], category: "zlacza")
Rule.create(antedecent: "muzyka", consequent: ["VGA"], category: "zlacza")

Rule.create(antedecent: "granie", consequent: ["4"], category: "CPU")
Rule.create(antedecent: "granie", consequent: ["RAM"], category: "16")
Rule.create(antedecent: "granie", consequent: ["dedykowana"], category: "grafika")
Rule.create(antedecent: "granie", consequent: ["dedykowana"], category: "muzyka")
Rule.create(antedecent: "granie", consequent: ["HDD"], category: "dysk")
Rule.create(antedecent: "granie", consequent: ["normalny"], category: "monitor")
Rule.create(antedecent: "granie", consequent: ["CD/DVD"], category: "naped")

Rule.create(antedecent: "biurowe", consequent: ["2"], category: "CPU")
Rule.create(antedecent: "biurowe", consequent: ["4"], category: "RAM")
Rule.create(antedecent: "biurowe", consequent: ["CD/DVD"], category: "naped")
Rule.create(antedecent: "biurowe", consequent: ["normalny"], category: "monitor")
Rule.create(antedecent: "biurowe", consequent: ["SSD"], category: "dysk")
Rule.create(antedecent: "biurowe", consequent: ["3.0"], category: "USB")
Rule.create(antedecent: "biurowe", consequent: ["zintegrowana"], category: "grafika")
Rule.create(antedecent: "biurowe", consequent: ["zintegrowana"], category: "muzyka")

############
Rule.create(antedecent: "typ", consequent: ["laptop", "ultrabook", "PC", "All-In-One"])
Rule.create(antedecent: "rodzaje uzytkowania", consequent: ["praca", "rozrywka"])
Rule.create(antedecent: "praca", consequent: ["rodzaje pracy"])
Rule.create(antedecent: "rozrywka", consequent: ["rodzaje rozrywki"])

Rule.create(antedecent: "rodzaje pracy", consequent: ["grafik", "programista", "biuro"])

Rule.create(antedecent: "rodzaje rozrywki", consequent: ["granie", "multimedia", "internet"])

Rule.create(antedecent: "internet", consequent: ["biurowe"])
Rule.create(antedecent: "grafik", consequent: ["grafika"])

Rule.create(antedecent: "montaz filmow", consequent: ["grafika", "muzyka"])

Rule.create(antedecent: "gry", consequent: ["grafika", "muzyka"])

Rule.create(antedecent: "programowanie", consequent: ["gier", "stron", "aplikacji"])

Rule.create(antedecent: "gier", consequent: ["gry"])
Rule.create(antedecent: "stron", consequent: ["biurowe"])
Rule.create(antedecent: "aplikacji", consequent: ["biurowe"])

Rule.create(antedecent: "biuro", consequent: ["biurowe"])

Rule.create(antedecent: "multimedia", consequent: ["filmy", "zdjecia", "muzyka"])
Rule.create(antedecent: "filmy", consequent: ["grafika", "muzyka"])
Rule.create(antedecent: "zdjecia", consequent: ["grafika"])


Rule.create(antedecent: "gry komputerowe", consequent: ["grafika", "muzyka", "granie"])

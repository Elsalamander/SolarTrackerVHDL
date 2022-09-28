Semplice solar tracker realizzato in VHDL durante il corso nel 2021.

In input c'è:
- 4 letture da 4 converitori ADC da 8 bit, per sapere quanto da una scala da 0 - 255 c'è luce in un punto (DX, SX, TOP, BOT)
- Un bit per abilitare o no l'inseguimento.
- Valore di differenza per incominciare il movimento in un asse finchè non si raggiunge un valore uguale o più basso di quello minimo.
- Valore di differenza minimo.

Output:
- 2 vettori da 2 bit rispettivamente i quali valori sono:
  - "00": sta fermo
  - "10": ruota a destra
  - "01": ruota a sinistra
  - "11": NON è contemplato

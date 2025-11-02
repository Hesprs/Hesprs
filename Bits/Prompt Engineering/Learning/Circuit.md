## Knowledge Point

| Chapter                   | Knowledge Point ID | Knowledge Point Content                                                              | Core Formula                                                                                             | Typical Examples (Document Sections)                                             |
| :------------------------ | :----------------- | :----------------------------------------------------------------------------------- | :------------------------------------------------------------------------------------------------------- | :------------------------------------------------------------------------------- |
| Circuit Analysis          | 2.1                | Kirchhoff's laws (including non-linear elements)                                     | $\sum I_{\text{in}} = \sum I_{\text{out}}$ (junction)<br>$\sum V = 0$ (loop)                             | 2022 Paper1 Q1m (maximum current in switch circuit); 2021 Q1q (resistor network) |
|                           | 2.2                | Capacitor charging/discharging (including non-linear resistance)                     | $V(t) = V_0e^{-t/RC}$ (RC circuit)<br>$R = AV + B$ (non-linear resistance)                               | 2022 Paper1 Q1v (capacitor discharge); 2020 Q1q (leaky capacitor)                |

---

## 2023 Paper1 Q1g

g) The resistance of a copper wire 1 m long with a mass of 1 g is 0.15 Ω. Find the length of a wire of the same material with a mass of 1000 kg and a resistance of 6000 Ω.

---

## 2021 Q1q

q) For the circuit shown in Fig. 2, what should be the value of the variable resistor R in order to minimise the power converted in the 10 Ω resistor?

```circuit
The circuit consists of a 20 V battery (voltage source) with two terminals: T1 (left) and T2 (right). 

- T1 is connected to the bottom end of an 8.0 Ω resistor.
- The top end of the 8.0 Ω resistor is connected to the bottom end of a 2.0 Ω resistor.
- The top end of the 2.0 Ω resistor is connected to the left end of a 4.0 Ω resistor.
- The right end of the 4.0 Ω resistor is connected to a common node (A).
- From node A, there are three parallel branches leading to T2:
  1. A 10 Ω resistor (connected directly from node A to T2)
  2. A 24 Ω resistor (connected directly from node A to T2)
  3. A series combination of a variable resistor R (from node A to node B) and a 20 Ω resistor (from node B to T2)
```

---

## 2007 Q5

(a) Two uncharged capacitors, $C_1$ and $C_2$, with capacitances $C_1$ and $C_2$, are connected in series with a battery and a switch S. When the switch is closed there is a charge $Q_1$ on $C_1$ and $Q_2$ on $C_2$.

(i) What is the relation between $Q_1$ and $Q_2$?

(ii) Give an expression for the potential difference across each capacitor.

(iii) Derive an expression for the capacitance, $C$, of a single capacitor equivalent to $C_1$ in series with $C_2$.

(iv) Calculate the total energy stored in the capacitors.

(b) An a.c. source of voltage $V$ and frequency $f$ is in series with a diode and a resistor, resistance $R$.

(i) Sketch a graph of the p.d., $V_R$, across the resistor as a function of time $t$.

(ii) Capacitors can be used to ‘smooth’ rectified a.c. voltages. A capacitor, capacitance $C$, is connected in parallel with the resistor, Figure 5.1. Explain, with a graph, how the modified p.d., $V_R$, varies with $t$.

```circuit
The circuit consists of an AC voltage source (V ~), a diode, a resistor (R), and a capacitor (C).

- The AC voltage source (V ~) has two terminals: T1 (top left) and T2 (bottom left).
- T1 is connected to the anode of a diode.
- The cathode of the diode is connected to a common node (A).
- Node A is connected to one terminal of resistor R and one terminal of capacitor C.
- The other terminal of resistor R is connected to T2.
- The other terminal of capacitor C is connected to T2.
- Resistor R and capacitor C are in parallel between node A and T2.
```

(iii) If the input voltage has a peak value of 10.000 V, $f = 100.000 \text{ Hz}$, $C = 400.000 \mu\text{F}$ and $R = 100.000 \Omega$, calculate the time $t_S$ for the p.d. across R to fall to its smallest value of 7.99049 V.

(iv) Verify that, to four significant figures, the input voltage also has this value at this time.

(v) The voltage across R can be approximated by the sum of a d.c. component, $V_d$, and an a.c. component with amplitude $V_a$ and frequency $f_a$. Estimate the values of $V_d$, $V_a$, and $f_a$.
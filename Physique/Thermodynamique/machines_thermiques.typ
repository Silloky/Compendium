#import "../../blocks.typ": *

On considère une machine monotherme qui échange un transfert thermiques $Q$ unique et du travail $W$. D'après l'inégalité de Clausius, on a $Q <= 0$ et $W >= 0$. La machine est donc réceptrice. \
*Il n'existe pas de moteur cyclique monotherme.*


#import "@preview/wrap-it:0.1.1": wrap-content

#wrap-content(
  image("assets/raveau.png", height: 5.5cm),
  [Pour une machine *ditherme*, l'inégalité de Clausius s'écrit : $display(Q_C/T_C + Q_F/T_F <= 0)$
  
  Les cycles idéalisés de Carnot sont réversibles et forment un rectangle dans le diagramme entropique. La puissance est cependant faible car le cycle doit être lent pour assurer l'isothermicité. \ Le *théorème de Carnot* limite le rendement d'une machine thermique ditherme.]
)





On appelle *moteur* une machine qui prend de l'énergie dans une source chaude et la transforme en travail, en rejetant le reste dans une source froide. \ Il est caractérisé par : $Q_C > 0$, $-Q_F > 0$, $-W > 0$.

Le rendement d'un moteur est donné par : $ r = -W/Q_C <= (T_C-T_F)/T_C $

On appelle *pompe à chaleur* une machine qui prend de l'énergie dans une source froide et pour la transférer dans une source chaude, en utilisant du travail. \ Elle est caractérisée par : $-Q_C > 0$, $Q_F > 0$, $W > 0$.
\ On considère les *efficacités* :

#flexwrap(
  flex: (1fr, 1fr),
  align(center, [
      Réfrigérateur#v(0.5mm)$display(e = Q_F/W <= T_F/(T_C-T_F))$
    ]),
  align(center, [
      Pompe à chaleur#v(0.5mm)$display(e' = -Q_C/W <= T_C/(T_C-T_F))$
    ])
)


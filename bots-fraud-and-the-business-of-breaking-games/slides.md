---
theme: default
title: Risk, Bots and the Business of Breaking Games
info: |
  HackersWeek 2026 — University of Malaga.
  Game security economics, bot and fraud ecosystems, and defensive trade-offs in online games.
author: Alberto Guerra González
colorSchema: dark
fonts:
  sans: Inter
  serif: Space Grotesk
  mono: JetBrains Mono
layout: cover
class: cover
---

<div class="eyebrow">HackersWeek 2026</div>

# Risk, Bots and the Business of Breaking Games

<!--
Audience warm-up

Hola hola. Buenos días! ¿Cómo estamos? Pausa

¿Qué pechá de gente en verdá, no? ¿Seguro que no os habéis equivocado de sala? Pausa

Uy, parece que alguno se acaba de levantar. Vamos a probar otra vez.

¿Hay alguien aquí al que le guste los videojuegos?

Levantad la mano los que juegen al LoL

Y al Valorant?

TFT?

Buah, pues igual si habéis venido a la sala correcta.

Más adelante habrá una parte un poco más interactiva, así que espero que os hayáis despertado del todo para entonces y me ayudéis.

Así que sin más dilación, muchas gracias por venir a mi charla y espero que la disfrutéis.
-->

---
layout: center
---

<div class="flex items-center gap-14">
  <img src="/images/author-avatar.webp" class="h-84 rounded-2xl shot" alt="Alberto Guerra González">
  <div class="relative">
    <div class="eyebrow">Staff Security Engineer</div>
    <h1 class="!text-5xl !mb-0">Alberto Guerra<br>González</h1>
    <img v-click src="/images/disclaimer-siren.gif" class="absolute left-0 top-[115%] h-32 rounded-xl shot -rotate-4" alt="Disclaimer siren">
  </div>
</div>

<!--
Me llamo Alberto. Como vosotros, hace ya un poquillo de tiempo, no tanto, estudié en esta Universidad. Desde entonces, me he pegado casi toda mi carrera currando como desarrollador backend, con algunas incursiones en el frontend en ese camino. Hace un par de años, me cambié de carril al mundo de la seguridad. Aunque todavía me considero nuevo en este terreno, ya he peleado un par de batallas.

Actualmente, trabajo para una empresa indie pequeña conocida como Riot Games. En concreto, en un equipo muy pequeño que se llama Player Security del que yo fui el primer ingeniero. Y hoy os vengo a hablar un poco de seguridad en la industria de los videojueguitos.

[click] 👆(Animation)

Antes de empezar, una pequeña advertencia. Lo primero de todo, estoy agradecido de que los jefazos me dejan utilizar el arte y branding de la empresa para esta charla. Dicho eso, todo lo que vais a escuchar hoy es un reflecto de mis experiencias y opiniones, no de las Riot Games.

Dicho eso, vamos al lío.
-->

---
layout: center
---

<div class="grid grid-cols-2 gap-5 w-[46rem]">
  <NumberedCard v-click n="01" title="Same But Different" />
  <NumberedCard v-click n="02" title="The Adversary Economy" />
  <NumberedCard v-click n="03" title="The Dark Arts" />
  <NumberedCard v-click n="04" title="Defence Against the Dark Arts" />
</div>

<!--
Esto es lo que vamos a hablar hoy: [click] 👆(Animation)

Same But Different. Empezaremos hablando de los desafíos en el campo de la ciberseguridad y de los compromisos que cada industria tiene que tomar para solucionarlos. [click] 👆(Animation)

The Adversary Economy. A continuación, investigaremos qué es lo que atrae actividad maliciosa al mundo de los juegos. [click] 👆(Animation)

The Dark Arts. Aquí nos pondremos en el lugar de los adversarios e intentaremos hackear un juego todos juntos. [click] 👆(Animation)

Defence Against the Dark Arts. Y, finalmente, analizaremos algunas de las técnicas utilizadas para detenerlos.

Así que nada, ¡vamos al lío! Que hay mucho por delante.
-->

---
layout: cover
class: section
---

<div class="numeral">01</div>
<div class="eyebrow">Section 01</div>

# Same But Different

Same problems. Different risks. Different choices

<!--
Igual pero diferente.

Mismos problemas. Riesgos distintos y elecciones distintas.
-->

---
layout: center
---

<div class="takeaway !text-4xl max-w-3xl">
As systems become cheaper to access and easier to scale, abuse shifts from isolated acts to industrialized activity
</div>

<!--
La transición de los sistemas analógicos a los sistemas en línea que trajo la democratización en el acceso a Internet cambión todas las industrias. La banca, la aviación, el comercio, la publicidad, el entretenimiento y muchas más.

Todas ellas se enfrentaron a un enemigo común: el fraude, el abuso y la automatización.

Sin embargo, no todas respondieron de la misma manera, porque lo que protegían y lo que significaba fallar es fundamentalmente distinto.
-->

---

# <fluent-emoji-flat-bank class="inline-icon" /> Banking

<div class="split">
<div>

## High Stakes Justify High Friction

- Real money. Clear liability.
- Heavy friction is acceptable.

</div>
<div class="grid grid-cols-2 gap-4">
  <img src="/images/banking-id-verification.jpg" class="w-full shot" alt="Identity verification">
  <img src="/images/banking-mobile-payment.jpg" class="w-full shot" alt="Mobile payment with MFA">
</div>
</div>

<!--
La banca es el ejemplo más claro.

Cuando los bancos se conectaron, la amenaza fue obvia: fraude a escala. El dinero real desaparece, los reguladores se involucran y la responsabilidad es clara.

Por eso, los bancos optimizaron la prevención. Fuertes comprobaciones de identidad (Know Your Customer), MFA en todas partes, transacciones bloqueadas, falsos positivos... y todo eso se considera aceptable.

¿Por qué? Porque los usuarios esperan fricción cuando hay dinero de por medio.

Aquí, la seguridad tiene permiso para ser visible, lenta y a veces molesta, porque la alternativa es inaceptable.

«En la banca, los falsos positivos son molestos, pero los falsos negativos son peores».
-->

---

# <fluent-emoji-flat-shopping-bags class="inline-icon" /> E-commerce

<div class="split">
<div>

## Conversion Beats Perfection

- Fraud is constant, but every extra step costs conversions.

</div>
<div class="flex justify-end">
  <img src="/images/ecommerce-captcha-checkout.jpg" class="h-76 shot" alt="Checkout with a CAPTCHA">
</div>
</div>

<!--
Ahora veamos el comercio electrónico.

El comercio electrónico lidia con el fraude constante: tarjetas robadas, vendedores falsos, abuso de reembolsos, tomas de cuentas, contracargos.

Pero no pueden bloquearlo todo, ya que cada paso adicional de verificación arriesga la pérdida de un cliente. Por lo tanto, el comercio electrónico optimiza la conversión.

En lugar de controles de identidad estrictos en todas partes, el comercio electrónico se basa en:

Señales de “humanidad” en el comportamiento, cómo detectar movimientos de ratón extraños o una velocidad de tecleado increíblemente rápida.

Índice de riesgo, que asigna un número, que puede ser un porcentaje, y define el riesgo de fraude basado en factores como la reputación del dispositivo o la falta de coincidencia de ubicación.

Fricción selectiva, como un captcha o un desafío 3-D Secure si el puntaje de riesgo es alto.

El objetivo no es eliminar el fraude, sino mantenerlo por debajo de un umbral tolerable.
-->

---

# <fluent-emoji-flat-admission-tickets class="inline-icon" /> Ticketing

<div class="split">
<div>

## Scarcity attracts bots

- Scarcity -> Abuse

</div>
<div class="flex gap-4 justify-end items-start">
  <img src="/images/ticketing-bot-suspended.webp" class="h-72 shot" alt="Session suspended for bot behaviour">
  <img src="/images/ticketing-queue.jpg" class="h-40 shot" alt="Ticketing waiting room queue">
</div>
</div>

<!--
La venta de entradas es uno de los ejemplos más claros de cómo los incentivos dan forma al abuso.

Las plataformas como Ticketmaster venden un recurso escaso: asientos limitados, franjas horarias, acceso a eventos. Esa escasez crea oportunidades para los revendedores (scalpers).

Los bots no atacan los sistemas de venta de entradas porque sean técnicamente interesantes. Los atacan porque:

La demanda es alta

La oferta es fija

La reventa es rentable

Desde la perspectiva del defensor, la venta de entradas tiene restricciones brutales.

No puedes añadir comprobaciones de identidad pesadas durante el lanzamiento de entradas.

No puedes ralentizar las cosas.

Cualquier fricción perjudica desproporcionadamente a los usuarios legítimos, no a los bots.

Por lo tanto, las plataformas de venta de entradas no intentan eliminar los bots por completo. Se centran en técnicas como:

Rate limiting

De nuevo, señales de humanidad o CAPTCHAs (Completely Automated Public Turing test to tell Computers and Humans Apart)

Sistemas de colas

Sistemas de loterías

Aplicación de medidas posteriores a la compra (Post-purchase enforcement)

El objetivo no es la seguridad perfecta. Es hacer que el abuso a gran escala sea más difícil que la compra legítima.
-->

---

# Case Study: Riftbound

<div class="relative h-[21rem]">
  <div class="absolute left-0 top-0 w-[30rem]">
    <Shot browser src="/images/riftbound-store.webp" alt="Riftbound store" />
    <div v-click="[1, 3]" class="absolute inset-0 top-[26px] grid grid-cols-8 place-items-center bg-[#0b1020]/60 rounded-b-xl text-3xl">
      <fluent-emoji-flat-robot v-for="i in 32" :key="i" />
    </div>
  </div>
  <fluent-emoji-flat-fire v-click="[2, 3]" class="absolute right-10 top-4 text-[9rem]" />
  <img v-click="3" src="/images/riftbound-registered.jpg" class="absolute right-0 top-0 w-[21rem] shot" alt="Riftbound lottery registration">
  <img v-click="4" src="/images/riftbound-purchase-email.jpg" class="absolute right-24 top-20 w-[13rem] shot" alt="Riftbound purchase wave email">
</div>

<!--
Vamos a hacer una pequeña pausa para poner un ejemplo reciente. No sé si hay alguien aquí que haya jugado a Riftbound, nuestro TCG.

Pero se me ocurrió este fin de semana que sería un buen ejemplo en esta sección ya que es uno de los proyectos en los que estoy involucrado y es un poco una combinación de los dos casos anteriores.

Riftbound es un caso bastante particular que combina un poco los problemas de Ecommerce y de Ticketing.

El primer lanzamiento fue bastante bien y dentro de lo esperado. La gente lo compró, empezó a jugar y les gustó.

¿Qué pasó en el lanzamiento del segundo set? [click] 👆(Animation)

Un TCG como Riftbound, si se vuelve muy popular se convierte en un recurso escaso. Es difícil de encontrar el producto en tienda por lo que los precios se disparan y la web the Riot se convierte en el único lugar donde se puede comprar a precio de venta al público.

Esto atrajo la atención del mundo de la reventa, y para el set 2 estaban más que preparados con un ejército de bots. [click] 👆(Animation)

¿Cómo lo resolvimos? O mejor dicho, ¿lo estamos resolviendo?

[click] 👆(Animation) Introduciendo un sistema de lotería que desincentiva la necesidad de correr por conseguir el producto, ya que todo el mundo tiene las mismas posibilidades dentro de la ventana para registrarse de un par de días. Esto hace que el pico de tráfico en el lanzamiento sea mucho menor y tanto la web como los sistemas que hay por debajo sean capaces de manejarlo.

Aplicando una revisión post-registro de las cuentas para asegurarnos de que pertenecen a humanos de verdad.

[click] 👆(Animation) Y, finalmente, controlando el acceso al paso final de compra a través de oleadas. Lo que de nuevo nos permite asegurarnos de que el tráfico que mandamos a Shopify sea sostenible.
-->

---

# <fluent-emoji-flat-video-game class="inline-icon" /> Gaming

<div class="split">
<div>

## Protect Meaning, Not Money

Games protect fairness and trust under near-zero tolerance for friction, which forces security to be invisible, risk-based, and continuous rather than heavy or preventative.

</div>
<div class="flex flex-col gap-4 items-end">
  <img src="/images/visual-captcha.jpg" class="h-36 shot" alt="Visual CAPTCHA challenge">
  <img src="/images/vanguard-game-terminated.jpg" class="h-36 shot" alt="Anti-cheat: game terminated">
</div>
</div>

<!--
Volviendo al tema original de esta sección de la charla, la última industria que quería mencionar es la de los videojuegos.

La diapositiva de antes ya daba una pista de por dónde va la cosa. Los videojuegos comparten la problemática de muchas de las industrias que ya he mencionado.

A su vez, los jugadores tienen muy poca tolerancia a la fricción.

Si iniciar sesión es tedioso, los jugadores se van.

Si la verificación interrumpe la partida, los jugadores abandonan (churn).

Si la seguridad se siente injusta, los jugadores culpan al desarrollador, no al atacante.

Así que la seguridad de los videojuegos tiene que responder de forma distinta.

No se trata de bloquear al jugador. Se trata de gestionar el riesgo de forma silenciosa, continua y a escala masiva.
-->

---
layout: center
---

<img src="/images/f5-credential-stuffing-by-industry.png" class="h-[27rem] shot" alt="F5 Advanced Persistent Bots report: credential stuffing by industry">

<!--
Para darle un poco de perspectiva a la problemática que tenemos, como dato mata a relato, aquí tenéis una tabla que he sacado del informe de Advanced Persistent Bots que la empresa F5 sacó el año pasado (que para los que no la conozcáis es de las más grandes en cuanto a sistemas de redes, protección anti DDoS, etc) donde podéis ver que la industria de los videojuegos es de las que más ataques de credenciales recibió en el año 2025.

Al final de la charla os compartiré un enlace donde podéis ver este informe además de otras fuentes que he usado para la charla.
-->

---
class: matrix
---

# Same Internet, Different Trade-Offs

| Industry | What’s being protected | Security Bias |
| --- | --- | --- |
| <fluent-emoji-flat-bank class="inline-icon mr-2" /> Banking | Money | Prevention & friction |
| <fluent-emoji-flat-airplane class="inline-icon mr-2" /> Aviation | Human Life | Redundancy & control |
| <fluent-emoji-flat-shopping-bags class="inline-icon mr-2" /> E-commerce | Trust & Refunds | Risk scoring |
| <fluent-emoji-flat-megaphone class="inline-icon mr-2" /> Advertising | Attention | Behavioral detection |
| <fluent-emoji-flat-admission-tickets class="inline-icon mr-2" /> Ticketing | Scarcity | Bot mitigation |
| <fluent-emoji-flat-video-game class="inline-icon mr-2" /> Gaming | Meaning (fairness & trust) | Invisible risk management |

<!--
En resumidas cuentas.

Ninguna de estas industrias lo hacen mejor o peor en el ámbito de la seguridad.

Hacen lo mejor que pueden en función de su contexto, incentivos y las consecuencias de sus fallos.
-->

---
layout: center
---

<div class="takeaway"><span class="dot">.</span>Security always has a cost.</div>

<!--
Y con eso, llegamos al final de la sección y la nota mental con la que os quiero que os quedéis.

La seguridad siempre tiene un coste — y ese coste es la fricción.

Cada control adicional pide al usuario que haga algo: esperar, verificar, reautenticase, y que demuestren en definitivas cuentas que son quien dicen ser.

Lo interesante no es si existe la fricción, sino cuánta fricción están dispuestos a tolerar los usuarios, y eso depende enteramente del contexto.

Cuando mueves dinero, esperas fricción.

Cuando vas a un aeropuerto para coger un avión, aceptas la fricción en el proceso de seguridad y embarque.

Cuando intentas jugar un juego quieres jugar y la fricción se siente como un obstáculo.

Lograr el equilibrio adecuado no es fácil. Requiere un profundo conocimiento del dominio: comprender las expectativas del usuario, los incentivos del atacante y el impacto de un falso positivo o un falso negativo en el sistema.

Esa diferencia en las expectativas del usuario —no la creatividad del atacante— es lo que da forma al diseño de la experiencia de usuario y a las decisiones de seguridad mucho antes de que los atacantes entren en escena.

Y por eso la seguridad tiene que ser parte del proceso de diseño, no algo que se añade después.
-->

---
layout: cover
class: section
---

<div class="numeral">02</div>
<div class="eyebrow">Section 02</div>

# The Adversary<br>Economy

Understanding Incentives, Not Villains

<!--
Audience warm-up

¿Cómo vamos? Pausa

¿Seguís conmigo? Pausa

Espero que el café haya empezado ya a surtir efecto

Venga, seguimos adelante.

------------------------------------------------------------------------

Hasta ahora, hemos hablado de restricciones. El siguiente paso es mirar lo que ocurre al otro lado de las restricciones.

Porque siempre que los sistemas generan valor, y especialmente a gran escala, alguien intentará extraer valor de forma inesperada y no deseada.

Para entender los bots, el robo de cuentas y el abuso en los juegos, necesitamos dejar de pensar en términos de "hackers" o "tramposos" y empezar a pensar en términos de economía.
-->

---
layout: center
---

<fluent-emoji-flat-money-with-wings class="big-icon" />

<!--
Aunque a un pequeño subconjunto de adversarios les gusta encontrar fallos por reputación, curiosidad o reconocimiento, la gran mayoría de los adversarios en los juegos no están aquí para arruinar la diversión por el simple hecho de arruinarla.

Están aquí por dinero.

Todo lo demás — la automatización, el phishing, el robo de cuentas, la evasión — es solo un medio para convertir el ecosistema alrededor de los videojuegos en algo que se pueda monetizar.
-->

---
layout: center
---

<fluent-emoji-flat-index-pointing-at-the-viewer class="big-icon" />

<!--
¿Y dónde está el dinero en un videojuego online? Pues en frente tuya cuando te miras al espejo. Tú eres el objetivo. O, mejor dicho, tu cuenta.

Una cuenta representa progresión, desbloqueos, rareza y, a veces, años de juego.

Incluso cuando los juegos son gratuitos (free-to-play), las cuentas no son gratis. Acumulan valor, y ese valor tiene un precio.
-->

---

# Steam

<div class="flex justify-center">
  <Shot browser src="/images/steam-library.webp" alt="A large Steam library" class="w-[34rem]" img-class="h-[18rem] object-cover object-top" />
</div>

<!--
Como primer ejemplo, vamos a mirar una cuenta de Steam.

La plataforma de Steam lleva en el mercado desde el el año 2003. Probablemente, algunos de aquí aún no existíais.

Durante todo ese tiempo, muchos jugadores han construído unas librerías extensas, con cientos de juegos, DLCs, ediciones especiales, etc.

Si sumas todo el dinero invertido más el tiempo, estamos hablando de miles de euros o incluso más.

Eso significa que la cuenta en sí se convierte en un activo. Y los activos atraen mercados.
-->

---

# League of Legends

<div class="relative flex justify-center">
  <Shot browser src="/images/lol-account-valuation-tool.webp" alt="Online account valuation tool" class="w-[40rem]" />
  <img v-click src="/images/lol-account-value.png" class="zoom-in absolute left-1/2 top-[38%] -translate-x-1/2 w-[34rem] shot" alt="Estimated account value">
</div>

<!--
Un ejemplo un poco más personal. ¿Cuánto vale mi cuenta de League of Legends?

Usando una herramienta de valoración en línea, del tipo que cualquiera puede encontrar, estimé el valor de mi cuenta y este fue el resultado. [click] 👆(Animation)

Incluso ignorando el rango o el prestigio, la cuenta tiene un claro valor monetario.

Y aquí está la parte importante: Yo no elegí entrar en este mercado, pero mi cuenta aún participa en él.

Una pequeña advertencia: si alguna vez consultan herramientas como esta, tengan cuidado.

Muchos de los llamados sitios de "valoración de cuentas" son sólo páginas de phishing. La herramienta que utilicé no me pidió que iniciara sesión. Tuve que ingresar los datos de mi inventario manualmente, lo cual fue tedioso, pero seguro.
-->

---

# The Black Markets

<div class="grid grid-cols-2 gap-5">
  <Shot browser src="/images/market-lol-accounts-store.webp" alt="Account marketplace" img-class="h-36 object-cover object-top" />
  <Shot browser src="/images/market-accounts-for-sale.png" alt="Accounts for sale" img-class="h-36 object-cover object-top" />
  <Shot browser src="/images/market-accounts-listing.png" alt="Account listings" img-class="h-36 object-cover object-top" />
  <Shot browser src="/images/market-lol-accounts.png" alt="Account marketplace categories" img-class="h-36 object-cover object-top" />
</div>

<!--
Donde hay activos, los mercados aparecen.

El videojuegos, eso se traduce en mercados, públicos o privados, dedicados a la compraventa de cuentas. Los precios varían en función de la clasificación, el contenido, la región, edad, etc.

En este punto, el problema deja de ser teórico. Se vuelve económico.

Pero es importante hablar del otro lado de la ecuación. Estos mercados no existen de forma aislada. Si hay oferta es porque hay demanda.

Hay muchas razones por las que un jugador puede querer comprar una cuenta.

A veces es porque su cuenta anterior fue baneada por hacer trampas.

A veces se trata de pagar menos por el contenido o de saltarse la progresión que requiere mucho tiempo.

A veces es acceso: a una región restringida, un servidor diferente o un mercado con reglas distintas. Un ejemplo relacionado con el LoL sería Korea o China.

Y a veces se trata de estatus o creación de contenido; por ejemplo, streamers que ejecutan series de "Hierro a Aspirante".

Nada de esto significa que cada comprador tenga una intención maliciosa. Pero sí significa que mientras las cuentas y la progresión tengan valor, y mientras existan atajos, los mercados seguirán formándose a su alrededor.

Tengo que aprovechar esta oportunidad para desaconsejar el uso de cualquiera de estos servicios, si juegan a alguno de los juegos de Riot. Esto va en contra del Pacto de la Comunidad, lo que significa que las cuentas que pillamos infringiendo estas reglas serán baneadas tarde o temprano.
-->

---
layout: center
---

<div class="relative w-[44rem] h-[22rem]">
  <fluent-emoji-flat-robot v-click="[1, 3]" class="big-icon absolute left-12 top-1/2 -translate-y-1/2" />
  <fluent-emoji-flat-ninja v-click="[2, 3]" class="big-icon absolute right-12 top-1/2 -translate-y-1/2" />
  <img v-click="3" src="/images/treasure-chest.png" class="zoom-in absolute left-1/2 top-0 -translate-x-1/2 h-[22rem]" alt="Treasure chest">
</div>

<!--
Una vez aceptamos que las cuentas tienen valor, se ve de manera muy clara las opciones que tienen los adversarios.

Pueden:

[click] 👆(Animation) Crear cuentas a escala para farmerarlas y luego venderlas

[click] 👆(Animation) O robar cuentas que ya tengan un valor y revenderlas

Son caminos distintos para el mismo objetivo [click] 👆(Animation) hacer dinero.

El la siguiente sección entraremos en profundidad en cómo lo hacen, pero por ahora, lo importante es entender el qué los atrae y qué opciones tienen.
-->

---

# Why <fluent-emoji-flat-video-game class="inline-icon" />?

<div class="grid grid-cols-2 gap-5 mt-10">
  <NumberedCard v-click n="1" title="Low Legal Risk">Enforcement is inconsistent across regions</NumberedCard>
  <NumberedCard v-click n="2" title="Global demand">Always on. Emotionally driven</NumberedCard>
  <NumberedCard v-click n="3" title="Transferable assets">Accounts, items, currency are digital and easy to transfer</NumberedCard>
  <NumberedCard v-click n="4" title="Low Friction Tolerance">Players do not expect friction. Accounts are left exposed</NumberedCard>
</div>

<!--
¿Por qué el interés en los videojuegos?

Pues porque están en el punto perfecto de bajo riesgo y alta recompensa.

[click] 👆(Animation) El riesgo legal es bajo. La aplicación de la ley de propiedad intelectual es inconsistente entre países. Las pérdidas suelen ser indirectas.

[click] 👆(Animation) La demanda es global, siempre activa y está impulsada por las emociones.

[click] 👆(Animation) Los activos (cuentas, artículos, moneda) son digitales y fáciles de transferir.

[click] 👆(Animation) Y la baja tolerancia a la fricción que hablamos antes suele dar lugar a cuentas desprotegidas.
-->

---
layout: center
---

<div class="flex gap-16">
  <fluent-emoji-flat-video-game class="big-icon !text-[8rem]" />
  <fluent-emoji-flat-handshake class="big-icon !text-[8rem]" />
  <fluent-emoji-flat-broken-heart class="big-icon !text-[8rem]" />
</div>

<!--
Y podrías estar pensando:

Si la gente no se molesta en proteger sus propias cuentas ¿por qué debería importarnos?

¿Podría ser aceptable la actividad de bots, siempre y cuando no sea directamente costosa?

Y os contesto con otra pregunta. ¿Alguna vez habéis tenido alguien en partida que se suicida bajo torre? ¿O alguien que debería estar jugando en otro ELO? Pausa … Seguramente no fue un momento agradable.

Eso es porque, en primer lugar, los que dedicamos nuestro tiempo a jugar a este tipo de juegos lo hacemos porque nos importan. Esto no es un juego como decía el Xokas.

Independientemente de si ganamos o no, queremos es una experiencia justa y auténtica. Cuando eso se rompe, pues nos frustramos, y sentimos que todo ha sido una pérdida de tiempo.

Y sí, es cierto que hay implicaciones financieras obvias ligadas a los mercados negros que mencioné antes. Pero lo que realmente está en juego aquí no es solo la pérdida de ingresos.

Estos mercados habilitan comportamientos tóxicos al reducir las consecuencias. Si te banean una cuenta, te compras otra y a seguir.

Y una vez permites que esta actividad exista en tu ecosistema, el impacto financiero a la empresa es más grande de lo que puede parecer.

A corto plazo, habrá más tickets en el sistema de soporte de usuario, quejas en redes sociales, o más gastos en servidores por la existencia de bots en partida o skins que generan menos beneficios porque se explotan cosas como la diferencia de precios entre divisas.

Pero a medio y largo plazo, aparece como algo más difícil de medir y de recuperarse: la pérdida de la confianza de los jugadores que decidan dejar de jugar a tus juegos.
-->

---
layout: center
---

<div class="takeaway"><span class="dot">.</span>Your account is an asset.</div>

<!--
Y aquí llegamos al final de la sección y la nota mental con la que quiero que os quedéis.

Tu cuenta es un activo, tiene un valor y, si no quieres perderla, debes protegerla adecuadamente.
-->

---
layout: cover
class: section
---

<div class="numeral">03</div>
<div class="eyebrow">Section 03</div>

# The Dark Arts

The baddies pocket tricks

<!--
Audience warm-up

Bueno, y como os prometí, llegamos a la parte interactiva de la charla.

¿Estamos con energía?

Necesito vuestra ayuda para sacarla adelante o va a ser un poco fracaso.

Pausa

Bueno, vamos a llegar a un trato. Los que participéis, os pasáis al terminar la charla por aquí y me dejáis vuestro nombre de usuario para que os mande un recuerdo de la charla in-game como la skin del ward de Riot o el gun buddy según el juego que juguéis más.

¿Qué os parece? ¿Es un buen trato?

Si os preguntan, les decís que nos encontramos en partida, ¿ok?

--------------------------------------------------------------

Venga, ¡manos a la obra!

Vamos a hablar de Artes Oscuras y de los trucos que utilizan “los malos”.
-->

---
layout: center
---

<div class="flex gap-28">
  <fluent-emoji-flat-robot class="big-icon" />
  <fluent-emoji-flat-ninja class="big-icon" />
</div>

<!--
Como mencioné antes, existen mayoritariamente dos tipos de atacantes que utilizan las cuentas de usuario para su beneficio: los bots y los ladrones.

Como ejercicio, vamos a ponernos en el lugar de uno de ellos y jugar un juego que me he inventado para esta charla y se llama …
-->

---
layout: center
---

<img src="/images/pivot-or-give-up.webp" class="h-[26rem] shot" alt="Pivot or Give Up?">

<!--
Pivot or Give Up?

En este juego, el objetivo es atacar un MOBA que se llama Liga de las Lamentaciones.

Durante la partida, nos vamos a ir encontrando obstáculos y tendremos que decidir si cambiamos de rumbo o nos rendimos, de ahí lo de Pivot or Give Up.

Pero para poder atacar el juego, tenemos que saber cómo funciona.
-->

---
layout: center
---

<img src="/images/lamentaciones-game.webp" class="h-[26rem] shot" alt="Liga de las Lamentaciones">

<!--
Liga de las Lamentaciones es un MOBA multiplataforma. Eso significa que se juega en PC y en móviles.

La mayor fuente de ingresos viene de los cosméticos que los jugadores pueden comprar en el juego para representar su identidad, o verse de una manera más atractiva o divertida.
-->

---
layout: center
---

<img src="/images/lamentaciones-store.webp" class="h-[26rem] shot" alt="Liga de las Lamentaciones store">

<!--
La tienda del juego tiene una mecánica gatcha donde los jugadores pueden comprar un cofre que tiene donde tienen distintas probabilidades de obtener contenido. El objetivo es que les toque la skin legendaria que tiene el menor porcentaje de probabilidad de que toque.

Y aquí viene lo interesante.

Para intentar que los jugadores se animen a instalar la versión móvil, el equipo de Publishing ha convencido a los desarrolladores del juego a que regalen 1 cofre a cada cuenta que se instale la aplicación y active las notificaciones. Sólo un cofre por cuenta.
-->

---
layout: center
---

<DropCards :drops="[
  { name: 'Exclusive Drop', value: '$1000', rate: '0.01%', rare: true },
  { name: 'Pity Drop', value: '$0.01', rate: '99.99%' },
]" />

<!--
Vamos a hacer unas cuentas para ver la dinámica económica que esto genera.

Las cuentas que tienen la skin legendaria se están vendiendo por $1000.

Por otro lado, una cuenta nueva sin contenido alguno o contenido de bajo valor se vende por $5.

Para este ejercicio, vamos a suponer que inundar el mercado con millones de cuentas no va a afectar su valor. Aunque si de verdad nos importara eso, siempre podríamos controlar el volumen de cuentas que ofrecemos en el mercado para minimizar el impacto de la desvalorización.

Con esta probabilidad de que nos toque el contenido exclusivo, por cada 10k cuentas que generamos, deberíamos al menos conseguir una cuenta con contenido exclusivo. Es decir, $1000.

Disclaimer: estos números son totalmente inventados para este caso hipotético, así que seguidme el rollo un poco.
-->

---
layout: cover
class: section centered
---

# Think like a <fluent-emoji-flat-robot class="inline-icon" />

<!--
Vamos a pensar como un botter.

Al ver estos números, creemos que hay una oportunidad de beneficio si creamos cuentas, activando las notificaciones y abriendo los cofres. Con suerte, en alguna nos tocará el contenido exclusivo. Cuanto tengamos suficientes cuentas, podemos ofrecerlas en una web rusa conocida como blackmarket[.]com.

¡Venga! Empieza la partida
-->

---
layout: center
---

<img src="/images/signup.webp" class="h-[26rem] shot" alt="Create your account">

<!--
Para crear una cuenta, necesitamos un email.

¿Qué tipo de problemas puede traer esto a escala?

Puede ser que nos obliguen a proporcionar un email que sea válido sintácticamente.

Puede ser que nos obliguen a que cada cuenta tenga un email único.

Puede ser que nos obliguen a verificar el email después de crear la cuenta para poder usarla, es decir, que exista.

Para este ejercicio, vamos a decir que las única limitaciones es que el email sea único por cada cuenta y válido sintácticamente.
-->

---
layout: center
---

<img src="/images/pivot-or-give-up.webp" class="h-[26rem] shot" alt="Pivot or Give Up?">

<!--
Pivot or Give Up?

Así que ese es el primer obstáculo. Necesito ideas.

¿Cómo podemos crear muchas cuentas con emails únicos?

… (Open it up to the room) …

Prompts:

Un detalle importante es que los emails no tienen por qué existir. Es decir, conque sigan el RFC 5322, nos vale.

Para resumir, tenemos opciones:

Options:

Opción A. Usar un proveedor de emails (como MailSlurp) para generar cuentas de email reales.

Opción B. Registrar un dominio que controlemos y, a partir de ahí, generar cuentas de email en ese dominio.

Opción C. Utilizar sufijos para crear aliases únicos utilizando sólo una cuenta. Por ejemplo, botaccount+01@gmail.com.

Todas son potencialmente válidas pero algunas son más costosas. Así que nos vamos a ir con la opción que añade sufijos que es la más barata.
-->

---
layout: center
---

<div class="relative h-[26rem] aspect-[3/2]">
  <img src="/images/monitor.jpg" class="h-full w-full rounded-xl" alt="Monitor">
  <BotFarm :tiles="6" :columns="3" fill class="absolute left-[15.2%] top-[11.4%] w-[69.4%] h-[52.6%]" />
</div>

<!--
Ok, ya tenemos una manera de generar cuentas, así que toca escalar la operación y automatizarla. No vamos a malgastar tiempo haciéndolo a mano.

Hemos escrito un script utilizando Playwright que crea 10 tareas en paralelo que automatizan el proceso de creación de cuenta. Cada tarea tarda 1 minuto en completar el proceso.
-->

---
layout: center
---

<Ledger :rows="[
  { label: 'Market Value', value: '$1000' },
  { label: 'Drop Rate', value: '0.01%' },
  { label: 'Cloud VM/day', value: '$100' },
  { label: 'Numbers of Devices', value: '1' },
  { label: 'Accounts/minute', value: '10' },
  { label: 'Exclusive Content Accounts', value: '1' },
  { label: 'Pity Accounts', value: '~14,000' },
  { label: 'Income', value: '$1000 (exclusive) + $143.98 (pity)', kind: 'income' },
  { label: 'Costs', value: '-$10', kind: 'cost' },
  { label: 'Total', value: '$1133.98', kind: 'total' },
]" />

<!--
Vamos a hacer cuenta.

A un ritmo de 10 cuentas por minuto, en un día somos capaces de generar:

Entre 1 o 2 cuentas con la skin legendaria.

Unas 14000 cuentas sin la skin

Vamos a contar también el coste de electricidad de dejar el ordenador funcionando un día entero como $10, lo que nos deja un beneficio aproximado de $1100 al día.

¿No está mal, no?
-->

---
layout: center
---

<div class="relative h-[26rem] aspect-[3/2]">
  <img src="/images/monitor.jpg" class="h-full w-full rounded-xl" alt="Monitor">
  <BotFarm :tiles="6" :columns="3" fill class="absolute left-[15.2%] top-[11.4%] w-[69.4%] h-[52.6%]" />
</div>

<!--
Pues venga, nos ponemos a ejecutar el script y, después de 2 minutos, nos pasa esto.
-->

---
layout: center
---

<img src="/images/signup-rate-limit.webp" class="h-[26rem] shot" alt="Rate limit exceeded">

<!--
Oh, oh. Nuestro segundo obstáculo.

Parece que se han dado cuenta de que estamos creando las cuentas desde el mismo dispositivo y nos están haciendo rate limit.
-->

---
layout: center
---

<img src="/images/pivot-or-give-up.webp" class="h-[26rem] shot" alt="Pivot or Give Up?">

<!--
Pivot or Give Up?

Ideas. ¿Qué hacemos ahora?

… (Open it up to the room) …

Prompts:

¿Qué tipo de información pueden estar utilizando para hacer rate limit?

IP (lo más común)

MAC

…

¿Qué opciones tenemos para mandar peticiones desde IPs distintas?

Options:

Option A: Podemos intentar bajar el ritmo de creación de cuentas y ver si conseguimos evitar el rate limit.

Option B: Podemos reiniciar el router cada vez que nos pase y ver si nos da otra IP.

Option C: Podemos mover nuestra operación a la nube y utilizar una NAT gateway con varias IPs asignadas.

Movernos a la nube es la mejor idea. No sólo porque nos habilita la opción de usar varias IPs desde el mismo dispositivo sino porque nos permite crear un usar muchos dispositivos en paralelo.

Vamos de nuevo a la calculadora.
-->

---
layout: center
---

<Ledger :rows="[
  { label: 'Market Value', value: '$1000' },
  { label: 'Drop Rate', value: '0.01%' },
  { label: 'Cloud VM/day', value: '$100' },
  { label: 'Numbers of Devices', value: '10', changed: true },
  { label: 'Accounts/minute', value: '100', changed: true },
  { label: 'Exclusive Content Accounts/day', value: '10', changed: true },
  { label: 'Pity Accounts/day', value: '~140,000', changed: true },
  { label: 'Income', value: '$10000 (exclusive) + $1439.8 (pity)', kind: 'income', changed: true },
  { label: 'Costs', value: '-$1000', kind: 'cost', changed: true },
  { label: 'Total', value: '$10439.8', kind: 'total', changed: true },
]" />

<!--
Usando la nube, podemos escalar la operación tanto como queramos pero hay un coste asociado.

Suponiendo que tener una máquina virtual en la nube funcionando un día entero nos cuesta $10. Y, con 10 VMs, podemos generar 100 cuentas por minuto.

Eso significa que en un día, podemos conseguir:

10 cuentas con la skin exclusiva

140,000 cuentas de bajo valor

Haciendo balance de ingresos y gastos podemos ver que la operación se vuelve hasta más rentable. Así que seguimos con adelante.
-->

---
layout: center
---

<BotFarm :tiles="90" :limited="3" :columns="15" class="w-[52rem]" />

<!--
Tenemos nuestra mini granja funcionando y todo va bien.

De vez en cuando alguna tarea todavía ve el error de rate limit pero es poco frecuente y no nos limita.

Dejamos la granja funcionando un rato y, después de unas horas, nos encontramos con esto.
-->

---
layout: center
---

<img src="/images/signup-captcha.webp" class="h-[26rem] shot" alt="I'm not a robot">

<!--
Parece que la actividad de nuestra granja de bots ha sido detectada por sus protecciones antibot.
-->

---
layout: center
---

<img src="/images/pivot-or-give-up.webp" class="h-[26rem] shot" alt="Pivot or Give Up?">

<!--
Pivot or Give Up?

¿Y ahora qué?

… (Open it up to the room) …

Prompts:

Vamos a pensar cómo funcionan estas protecciones antibot. El objetivo es saber si hay un humano detrás. Por lo que recaudan información de la interacción con el cliente como el tipo de dispositivo, red, navegador además de mirar el comportamiento (movimiento del ratón, ritmo de tecleo) para determinar el riesgo de la interacción y, si hay alguna sospecha, hacen un challenge visual al cliente.

¿Qué es lo más sospechoso de nuestra granja para que hayan saltado las alarmas?

Normalmente, las protecciones antibot conocen los rangos de IPs que usan los proveedores de nube y saben que los jugadores legítimos no juegan desde la nube.

También suelen conocer los rangos de IPs de las VPNs comerciales.

Options:

Option A. Podemos invertir en nuestro script para intentar pasar desapercibidos. Inyectando fingerprints, user agents, movimientos de ratón más lentos.

Option B. Podemos utilizar VPNs comerciales para randomizar más las IPs.

Option C. Podemos usar IPs residenciales a través de proxies residenciales. De esa manera, el tráfico parece venir de IPs de proveedores de Internet compartidos con otros jugadores.

Los proxies residenciales son servicios de proxy que enrutan el tráfico a través de direcciones IP asignadas a hogares reales por los proveedores de servicios de Internet (ISP). Estas IP pueden obtenerse mediante el consentimiento explícito de los usuarios para compartir ancho de banda (a través de aplicaciones, SDKs o extensiones), mediante acuerdos directos con los ISP o —en el extremo ilegítimo— a través de dispositivos comprometidos en botnets. Esto hace que las solicitudes parezcan originarse desde conexiones normales de consumidores en lugar de centros de datos.

Un ejemplo del extremo ilegítimo fue el caso de Oko VPN. Lo que parecía una VPN comercial gratuita incluía un SDK (proxylib) que registraba el dispositivo con un backend y permitía a este backend mandar tareas a ejecutar desde la red del dispositivo.

Vamos a mirar la calculadora a ver qué nos dice de los proxies residenciales.
-->

---
layout: center
---

<Ledger :rows="[
  { label: 'Market Value', value: '$1000' },
  { label: 'Drop Rate', value: '0.01%' },
  { label: 'Cloud VM/day', value: '$100' },
  { label: 'Numbers of Devices', value: '10' },
  { label: 'Accounts/minute', value: '100' },
  { label: 'Exclusive Content Accounts/day', value: '10' },
  { label: 'Pity Accounts/day', value: '~140,000' },
  { label: 'Income', value: '$10000 (exclusive) + $1439.8 (pity)', kind: 'income' },
  { label: 'Cloud Costs', value: '-$1000', kind: 'cost' },
  { label: 'Proxy Costs', value: '-$4200', kind: 'cost', changed: true },
  { label: 'Total', value: '$6,239.8', kind: 'total', changed: true },
]" />

<!--
El modelo de precios de estos proxies está asociado normalmente con el ancho de banda utilizado. Por lo tanto, ahora hay un coste asociado a cada creación de cuenta.

Vamos a decir que ese coste son $0.03 por cada cuenta.

Cuando hacemos balance de gastos en ingresos vemos que la operación todavía es rentable. Así que seguimos.
-->

---
layout: center
---

<div class="flex gap-8 items-start">
  <BotFarm :tiles="16" :limited="3" :columns="4" class="w-[26rem]" />
  <div class="flex flex-col items-center gap-4 w-[22rem]">
    <Shot v-click browser src="/images/market-accounts-for-sale.png" alt="Accounts for sale" img-class="h-48 object-cover object-top" />
    <div v-click class="flex">
      <img v-for="i in 3" :key="i" src="/images/money-bag.webp" class="h-24" alt="Money bag">
    </div>
  </div>
</div>

<!--
Estamos de nuevo a full. De nuevo vemos el rate limit de vez en cuando pero no nos ralentiza.

[click] 👆(Animation) Hemos empezado a vender las cuentas [click] 👆(Animation) y el dinero empieza a entrar.

Sin embargo, pasan dos semanas y nos encontramos con esto.
-->

---
layout: center
---

<div class="grid grid-cols-4 gap-1 w-[36rem]">
  <img v-for="i in 16" :key="i" src="/images/signup-captcha.webp" class="w-full rounded-sm" alt="CAPTCHA">
</div>

<!--
It seems they have found a way to monitor and block our activity again. The Security team behind the antibot solution is quick to react to these attacks.
-->

---
layout: center
---

<div class="relative">
  <img src="/images/pivot-or-give-up.webp" class="h-[26rem] shot" alt="Pivot or Give Up?">
  <img v-click src="/images/click-farm.webp" class="absolute left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 h-[19rem] shot" alt="CAPTCHA-solving click farm">
</div>

<!--
Pivot or Give Up?

Se pone la cosa difícil pero todavía tenemos opciones.

¿Qué hacemos?

… (Open it up to the room) …

Prompts:

¿Y si intentamos automatizar la resolución del CAPTCHA?

¿Qué opciones tenemos aquí?

Options:

Option A. Intentar saltarse el CAPTCHA mejorando nuestro script de nuevo.

Option B. Usar plugin de navegador para resolver el CAPTCHA o desarrollar nuestra solución usando ML.

Option C. Usar un servicio de resolución de CAPTCHA.

[click] 👆(Animation) Ya que la mayoría de los plugins acaban fallando y desarrollar nuestra solución con ML y mantenerla actualizada es muy costoso, lo más sencillo es usar una granja de clicks a través de un servicio de resolución de CAPTCHA.

Vamos a abrir la calculadora y ver si nos merece la pena.
-->

---
layout: center
---

<Ledger :rows="[
  { label: 'Market Value', value: '$1000' },
  { label: 'Drop Rate', value: '0.01%' },
  { label: 'Cloud VM/day', value: '$100' },
  { label: 'Numbers of Devices', value: '10' },
  { label: 'Accounts/minute', value: '100' },
  { label: 'Exclusive Content Accounts/day', value: '10' },
  { label: 'Pity Accounts/day', value: '~140,000' },
  { label: 'Income', value: '$10000 (exclusive) + $1439.8 (pity)', kind: 'income' },
  { label: 'Cloud Costs', value: '-$1000', kind: 'cost' },
  { label: 'Proxy Costs', value: '-$4200', kind: 'cost' },
  { label: 'Captcha Costs', value: '-$3000', kind: 'cost', changed: true },
  { label: 'Total', value: '$3,239.8', kind: 'total', changed: true },
]" />

<!--
El modelo de precios de las granjas de CAPTCHA normalmente cobra por cada CAPTCHA que tienen que resolver.

Supongamos que, por cada CAPTCHA, tenemos que pagar 0,02 céntimos.

Apenas estamos obteniendo ganancias y ahora la mayor parte de nuestros ingresos se está consumiendo en costos. Veamos si multiplicarlo por 10 ayudará a que esto sea más atractivo. (Next slide)
-->

---
layout: center
---

<Ledger :rows="[
  { label: 'Market Value', value: '$1000' },
  { label: 'Drop Rate', value: '0.01%' },
  { label: 'Cloud VM/day', value: '$100' },
  { label: 'Numbers of Devices', value: '100', changed: true },
  { label: 'Accounts/minute', value: '100' },
  { label: 'Exclusive Content Accounts/day', value: '100', changed: true },
  { label: 'Pity Accounts/day', value: '1,400,000', changed: true },
  { label: 'Income', value: '$100,000 (exclusive) + ~$14,000 (pity)', kind: 'income', changed: true },
  { label: 'Cloud Costs', value: '-$10000', kind: 'cost', changed: true },
  { label: 'Proxy Costs', value: '-$42000', kind: 'cost', changed: true },
  { label: 'Captcha Costs', value: '-$30000', kind: 'cost', changed: true },
  { label: 'Total', value: '~$32000', kind: 'total', changed: true },
]" />

<!--
Las economías de escala siguen jugando a nuestro favor y, al ampliar la operación, obtenemos aún más ganancias.

Así que continuamos.
-->

---
layout: center
---

<div class="relative w-[52rem] h-[26rem]">
  <div class="flex gap-8 items-start">
    <BotFarm :tiles="16" :limited="3" :columns="4" class="w-[26rem]" />
    <div class="flex flex-col items-center gap-3 w-[22rem]">
      <Shot browser src="/images/market-accounts-for-sale.png" alt="Accounts for sale" img-class="h-40 object-cover object-top" />
      <div class="grid grid-cols-9">
        <img v-for="i in 18" :key="i" src="/images/money-bag.webp" class="h-10" alt="Money bag">
      </div>
    </div>
  </div>
  <img v-click src="/images/vanguard-cheater-detected.png" class="zoom-in absolute left-1/2 top-[42%] -translate-x-1/2 -translate-y-1/2 w-[32rem] shot" alt="Accounts banned">
  <div v-click class="absolute left-0 right-0 bottom-0 flex justify-center gap-2 text-5xl">
    <fluent-emoji-flat-pouting-face v-for="i in 13" :key="i" />
  </div>
  <fluent-emoji-flat-no-entry v-click class="fade-slow absolute -right-4 -top-6 text-[7rem]" />
</div>

<!--
Volvemos a funcionar. La operación continúa durante otra semana, pero, nuevamente, algo sucede. [click] 👆(Animation)

El aumento en la escala de nuestra operación llamó la atención del equipo de Game Security y pusieron manos a la obra para encontrar una forma de defenderse de este ataque.

Durante su investigación, encontraron la manera de identificar todas nuestras cuentas. Parece que usar el mismo prefijo de correo electrónico no fue tan buena idea después de todo.

Han baneado todas las cuentas y ahora nuestros clientes están enfadados.

También se dieron cuenta de que regalar contenido no era tan buena idea y acordaron con el equipo de Publishing detener la campaña, eliminando nuestra principal fuente de ingresos.
-->

---
layout: center
---

<img src="/images/pivot-or-give-up.webp" class="h-[26rem] shot" alt="Pivot or Give Up?">

<!--
Pivot or Give Up?

Lo veo difícil.

Pero vamos a ver qué dice la calculadora.
-->

---
layout: center
---

<Ledger :rows="[
  { label: 'Market Value', value: '$1000' },
  { label: 'Drop Rate', value: '0.01%' },
  { label: 'Cloud VM/day', value: '$100' },
  { label: 'Numbers of Devices', value: '100' },
  { label: 'Accounts/minute', value: '100' },
  { label: 'Exclusive Content Accounts/day', value: '100' },
  { label: 'Pity Accounts/day', value: '1,400,000' },
  { label: 'Income', value: '$14,000', kind: 'income', changed: true },
  { label: 'Cloud Costs', value: '-$10000', kind: 'cost' },
  { label: 'Proxy Costs', value: '-$42000', kind: 'cost' },
  { label: 'Captcha Costs', value: '-$30000', kind: 'cost' },
  { label: 'Total', value: '-$68000', kind: 'total', changed: true },
]" />

<!--
Sin la skin exclusiva, todavía podemos farmear cuentas sin contenido.

Sin embargo, si hacemos balance de beneficios y costes, vemos que tendríamos unas pérdidas de $68,000.

Así que es el momento de darse por vencido, hemos sacado un poco de beneficio mientras duró la campaña y toca retirarse.
-->

---
layout: center
---

<div class="takeaway"><span class="dot">.</span>Make abuse unprofitable</div>

<!--
La primera nota mental de esta sección es: haz que el abuso no sea rentable.

No estamos intentando construir un sistema impenetrable — eso no existe.

Lo que sí podemos hacer es aumentar el costo de los ataques: más fricción, más tiempo, más infraestructura, más riesgo.

Y cuando el retorno de la inversión deja de tener sentido, los atacantes se trasladan a objetivos más fáciles.
-->

---
layout: center
---

<div class="flex flex-col items-center gap-6">
  <img src="/images/infinity-gauntlet.jpg" class="h-[20rem] shot" alt="Infinity gauntlet">
  <div class="flex gap-8 text-6xl">
    <fluent-emoji-flat-robot />
    <fluent-emoji-flat-ninja />
    <fluent-emoji-flat-fishing-pole />
    <fluent-emoji-flat-credit-card />
    <fluent-emoji-flat-bullseye />
  </div>
</div>

<!--
Voy a pasar muy rápido sobre esta parte.

Hasta ahora, nos hemos centrado en el abuso alrededor de las cuentas. Pero esa no es la única fuente de abuso.

Hay un ecosistema de ataques cuyo objetivo son los jugadores de forma directa. Engañándoles o ofreciéndoles servicios que no violan los Términos y Condiciones.

Utilizan tácticas distintas pero el objetivo sigue siendo hacer dinero. Lo que cambia es el cómo.

Nos referiremos a ellos como estafadores, tramposos y defraudadores.
-->

---

# Other Attackers

<div class="grid grid-cols-3 gap-5 mt-10">
  <NumberedCard v-click n="1" title="Scammers"><template #icon><fluent-emoji-flat-fishing-pole /></template>Use social engineering and deception to manipulate players into paying for goods or services outside the game.</NumberedCard>
  <NumberedCard v-click n="2" title="Fraudsters"><template #icon><fluent-emoji-flat-credit-card /></template>Exploit economic or system loopholes to generate profit from otherwise legitimate game mechanics.</NumberedCard>
  <NumberedCard v-click n="3" title="Cheaters"><template #icon><fluent-emoji-flat-bullseye /></template>Develop and sell tools that provide unfair in-game advantages and undermine competitive integrity.</NumberedCard>
</div>

<!--
Y voy a repasarlos rápidamente por cuestión de tiempo.

[click] 👆(Animation) Los estafadores se centran principalmente en conseguir que los jugadores paguen por algo.

Un caso especialmente interesante que descubrimos a través de Reddit fue el caso de Lily. Un bot construido con un LLM que los atacantes utilizan para hacerse pasar por un jugador real — adoptando la identidad de una “e-girl” con la que un jugador había jugado previamente. La interacción se siente personal, ya que hace referencia a las partidas anteriores y empieza a ligar con el jugador. Tras un rato, intenta trasladar la conversación a Discord donde termina de ejecutar la estafa. Afortunadamente, los jugadores se dieron cuenta rápidamente y hay varios posts en Reddit de jugadores que consiguen sacarle el prompt y pidiéndole recetas de cocina o Haikus. Mientras tanto, nosotros estamos baneando todas las cuentas que encontramos.

[click] 👆(Animation) Los defraudadores, por otro lado, explotan vacíos económicos y fallos a nivel de sistema. En lugar de engañar a jugadores individuales, buscan inconsistencias — como diferencias de precios entre regiones o fallos en los sistemas de regalos — y las convierten en beneficio.

En un caso, una actor aprovechó una vulnerabilidad en un sistema de regalos para comprar moneda del juego a bajo costo en una región, transferir cuentas y revender contenido con descuento mientras seguían obteniendo margen de ganancia. Estos esquemas pueden parecer legítimos en la superficie, lo que los hace especialmente difíciles de detectar. Afortunadamente para nosotros, muchos de estos actores tienen bastante ego, y este en concreto se dedicó ir de chulo por Twitter contando todo el dinero que hacía cada día. Así que fue bastante fácil de pillar.

[click] 👆(Animation) Finalmente, están los tramposos. Estos actores desarrollan y venden herramientas que otorgan a los jugadores una ventaja injusta — como aimbots, wallhacks o la eliminación de la niebla de guerra.
-->

---
layout: center
---

<div class="takeaway"><span class="dot">.</span>Think like the attacker</div>

<!--
La segunda nota mental de esta sección es: piensa como un adversario.

Los adversarios no se preocupan por cómo se supone que deben funcionar los sistemas, sino por cómo pueden abusar de ellos.

Buscan atajos, casos límite e interacciones no previstas.

Si queremos defendernos de forma efectiva, necesitamos analizar nuestros sistemas de la misma manera.

No desde los casos de uso “happy path”, sino desde la mentalidad de cómo un adversario podría intentar romper el sistema.

Porque las defensas más sólidas no se construyen asumiendo un buen comportamiento, sino asumiendo el abuso.
-->

---
layout: cover
class: section
---

<div class="numeral">04</div>
<div class="eyebrow">Section 04</div>

# Defence Against<br>The Dark Arts

How to protect the ecosystem

<!--
Y ahora que entendemos por qué estamos aquí y los problemas con los que lidiamos, es hora de hablar de cómo podemos protegernos contra ellos.
-->

---
layout: center
---

<div class="compact flex flex-wrap justify-center gap-4 w-[54rem]">
  <NumberedCard n="1" title="Risk based thinking" class="!w-[12.6rem] !h-[6.5rem]" />
  <NumberedCard n="2" title="Multifactor Authentication (MFA)" class="!w-[12.6rem] !h-[6.5rem]" />
  <NumberedCard n="3" title="Email Verification" class="!w-[12.6rem] !h-[6.5rem]" />
  <NumberedCard n="4" title="Anomaly Detection & Notifications" class="!w-[12.6rem] !h-[6.5rem]" />
  <NumberedCard n="5" title="ATO Detection & Recovery" class="!w-[12.6rem] !h-[6.5rem]" />
  <NumberedCard n="6" title="Anticheat" class="!w-[12.6rem] !h-[6.5rem]" />
  <NumberedCard n="7" title="Infiltrate" class="!w-[12.6rem] !h-[6.5rem]" />
</div>

<!--
Siguiendo con la metáfora del Mundo Mágico, es hora de hablar de los hechizos principales para protegernos contra las artes oscuras.

Esta lista no cubre absolutamente todas las opciones pero os sirve para dar una idea de lo que hacemos.
-->

---

# Risk-Based Thinking

<div class="split">
<div>

- Move beyond one-size-fits-all security controls
- Assess risk dynamically using user, device, and network signals
- Balance protection with player experience in real time
- Keep low-risk actions frictionless
- Apply stronger safeguards to high-risk behavior
- Increase the cost of abuse without harming legitimate players

</div>
<div class="flex justify-center">
  <img src="/images/captcha-puzzle.jpg" class="w-[24rem] shot" alt="Step-up challenge">
</div>
</div>

<!--
Una mentalidad clave detrás de muchas defensas modernas es la toma de decisiones basada en riesgo.

En lugar de tratar cada solicitud de la misma manera, nos preguntamos: ¿Qué nivel de riesgo presenta esto, en este contexto (la operación que se está llevando a cabo), en este momento?

Para ello, la autenticación basada en riesgo recopila múltiples señales en tiempo real para decidir cómo debe proceder una autenticación. Estas señales pueden incluir aspectos como el comportamiento del usuario (velocidad de escritura en el teclado, movimiento del ratón), fingerprinting del dispositivo (navegador, GPU, sistema operativo, etc.), análisis de la red (IP, ASN) o historial previo del usuario.

Y, la combinación de todas las señales y el contexto se utilizan para definir la puntuación de riesgo de la operación sobre la que se toma la decisión final: permitirla, notificar al usuario, hacer un challenge/step-up (pedir información adicional) o bloquearla.

Esta mentalidad basada en riesgo no se limita al login. Podemos aplicarla a los flujos de registro, recuperación de cuenta, adquisición de contenido, envío de regalos y prácticamente cualquier operación sensible.

En cualquier lugar donde los adversarios intenten extraer valor, los controles basados en riesgo nos ayudan a aumentar el costo sin perjudicar a los jugadores legítimos.
-->

---

# MFA

<div class="split">
<div>

- Reduce the impact of credential theft beyond passwords
- Require attackers to defeat multiple independent factors
- Introduce technical and social barriers hard to scale
- Increase attacker effort, coordination, and cost
- Push many account takeover attempts out of reach

</div>
<div class="flex justify-center">
  <img src="/images/riot-mfa-code.webp" class="w-[24rem] shot" alt="Email verification code prompt">
</div>
</div>

<!--
Una de las formas más efectivas de ponérselo más difícil a quien quiera quedarse con una cuenta es la autenticación multifactor.

Con algo como el MFA por correo, el nota no solo necesita la contraseña — también tiene que meterse en tu bandeja de entrada. Y eso ya se carga un montón de ataques cutres y rápidos.

Si hablamos de MFA por dispositivo, ahí ya se lo ponemos más cuesta arriba todavía. Ahora el adversario tiene que conseguir que el jugador apruebe algo que ni siquiera ha iniciado — y eso, a gran escala, es bastante más complicado de colar.

Y ya estamos empezando a ver también el uso de llaves de seguridad, tipo YubiKey, en la industria del videojuego.

Cada factor extra no hace que el ataque sea imposible — pero sí que le sube bastante el coste y le quita las ganas a más de uno.
-->

---

# Email Verification

<div class="split">
<div>

- Serve as a foundational security control across the account lifecycle
- Reduce large-scale abuse enabled by unverified emails
- Enable delivery of critical security notifications
- Support account recovery and verification flows
- Act as a key enabler for stronger authentication and protection

</div>
<div class="flex justify-center">
  <img src="/images/riot-verify-email.png" class="h-[19rem] shot" alt="Verify your email">
</div>
</div>

<!--
La verificación del correo es un tema donde la industria del videojuego todavía va un poco a remolque.

Hay estudios que todavía dejan crear cuentas con correos que ni existen o que no están verificados.

Eso baja la fricción, sí… pero también deja la puerta abierta de par en par para el abuso.

Tener un correo válido es clave para la seguridad de la cuenta.

Permite activar el MFA, hacer recuperaciones automáticas y — lo más importante — avisar cuando pasa algo raro.

Si detrás de la cuenta no hay una bandeja de entrada real, perdemos uno de los canales más efectivos para comunicarnos con el jugador.
-->

---

# Anomaly Detection

<div class="split">
<div>

- Add an extra defensive layer by spotting unusual behavior
- Detect suspicious activity in near real time
- Alert players to sensitive or risky account changes
- Enable early intervention before damage escalates
- Share responsibility between platform and player to stop ATOs early

</div>
<div class="flex justify-center">
  <img src="/images/riot-signin-alert.png" class="h-[19rem] shot" alt="This sign-in looks different">
</div>
</div>

<!--
Esto nos lleva directamente a la detección de anomalías.

Hoy en día, en cualquier industria es ya lo normal avisar a los usuarios cuando pasa algo delicado — como cambiar la contraseña, modificar el correo o iniciar sesión desde un sitio raro.

Estos avisos le dan al jugador la oportunidad de reaccionar y asegurar su cuenta antes de que se la quiten del todo.
-->

---

# ATO Detection

<div class="split">
<div>

- Detect account takeovers automatically and at scale
- Analyze behavior and historical activity to spot compromises
- Protect players even when they can’t react themselves
- Intervene proactively to limit attacker impact
- Prioritize long-term account security over short-term disruption

</div>
<div class="flex justify-center items-center h-[19rem]">
  <fluent-emoji-flat-police-car-light class="big-icon" />
</div>
</div>

<!--
Escierto que los jugadores no siempre ven estos avisos.

Puede que no miren el correo, o que hayan perdido acceso a esa cuenta hace años y ni se acuerden.

Por eso las compañías de videojuegos también tiran de detección automática.

Tenemos visibilidad completa de la actividad de las cuentas, lo que nos permite usar heurísticas y modelos de machine learning para detectar cuándo una cuenta probablemente ha sido comprometida.

Cuando detectamos que se la han quedado, podemos actuar en nombre del jugador.

Eso puede significar revertir un cambio de correo, desactivar la cuenta temporalmente o forzar un cambio de contraseña.

No es perfecto — pero reduce muchísimo el daño que pueden hacer los adversarios.
-->

---

# Edge Security

<div class="split">
<div>

- Act as the first line of defense before traffic reaches core services
- Block known malicious sources at the edge
- Enforce baseline protections using CDNs and WAFs
- Respond quickly to emerging threats at scale
- Reduce risk exposure for individual application services

</div>
<div class="flex justify-center">
  <img src="/images/attack-map.webp" class="w-[26rem] shot" alt="Global attack traffic map">
</div>
</div>

<!--
Otra capa importante de defensa está en el edge, que es el punto de entrada a nuestros servidores.

La mayoría de estudios usan CDNs como Akamai o Cloudflare — no solo por el DDoS, sino también por sus Web Application Firewalls.

Los WAF trabajan en la capa de aplicación y filtran el tráfico HTTP antes de que llegue siquiera a nuestros servicios backend.

A través del WAF podemos bloquear tráfico de rangos de IP sospechosos, ciertos ASNs o patrones que ya sabemos que son maliciosos.

Además, estos proveedores suelen moverse rápido cuando sale una vulnerabilidad zero-day — cosas como Log4Shell o React2Shell — muchas veces incluso antes de que los equipos puedan parchearlo todo por su cuenta.
-->

---

# Anticheat

<div class="split">
<div>

- Protect competitive integrity directly on the player’s machine
- Detect cheats and automation invisible to server-side controls
- Operate at a deeper system level than traditional protections
- Highly effective but require strong transparency and trust
- Depend on responsible use and clear player communication

</div>
<div class="flex justify-center">
  <img src="/images/vanguard-game-terminated.jpg" class="w-[26rem] shot" alt="Anti-cheat: game terminated">
</div>
</div>

<!--
En juegos muy competitivos, la integridad dentro del propio cliente del juego también es clave.

Los anti-cheats a nivel de kernel, como Vanguard, funcionan más como un antivirus.

Pueden detectar procesos sospechosos, evitar que entren bots en las partidas y banear automáticamente ciertos tipos de trampas.

Es un control muy potente — pero también uno que requiere cuidado y, sobre todo, la confianza de los jugadores.
-->

---

# Infiltrate

<div class="split">
<div>

- Observe real attacker behavior in public coordination spaces
- Blend passive OSINT with active techniques like honeypot accounts
- Validate assumptions using real attack paths
- Surface weaknesses early through direct exposure
- Build defenses grounded in evidence, not theory

</div>
<div class="grid grid-cols-2 gap-4">
  <Shot browser src="/images/discord.jpg" alt="Discord server" img-class="h-56 object-cover object-top" />
  <Shot browser src="/images/twitter-osint.png" alt="Social media post" img-class="h-56 object-cover object-top" />
</div>
</div>

<!--
Una de las formas más efectivas de entender a los adversarios es observarlos donde se mueven.

Gran parte de esto entra dentro de lo que se llama OSINT (Open-Source Intelligence) — básicamente, recopilar y analizar información que está en fuentes públicas para entender cómo actúan de verdad.

En la práctica, eso significa vigilar sitios como Discord, que se ha convertido en un punto habitual de coordinación para trampas, venta de cuentas y otras movidas raras. También estamos muy pendientes de Reddit, como ya hemos hecho referencia antes

Otra fuente potente de OSINT es GitHub. Hay actores que publican abiertamente herramientas, scripts o pruebas de concepto en repos públicos. Eso puede revelar técnicas, patrones de automatización e incluso fallos operativos. Tener esa visibilidad ayuda muchísimo a entender cómo se ejecutan los ataques en la vida real.

Eso sí, antes de hacer nada de esto, es clave trabajar desde un entorno seguro y no trazable. Eso significa separar esta actividad de dispositivos e identidades corporativas, usar máquinas virtuales desechables, aislar la red siempre que se pueda y utilizar cuentas desacopladas asociadas a correos temporales.

El objetivo no es interactuar ni ir a por nadie — es obtener inteligencia. Cuando basamos nuestras defensas en el comportamiento real de los adversarios, y no en suposiciones, las protecciones que diseñamos son mucho más efectivas.
-->

---
layout: center
---

<div class="flex gap-6 items-center">
  <img src="/images/castle-fire.webp" class="h-[24rem] shot" alt="A path through fire">
  <img src="/images/castle-stairs.webp" class="h-[24rem] shot" alt="Stairs to a castle">
</div>

<!--
Ahora que hemos visto varias formas de protegernos de las Artes Oscuras, también toca hablar del impacto que pueden tener estas protecciones.

Porque cada vez que metemos una medida para cerrar un vector de ataque, también asumimos ciertos riesgos.

Así que vamos a ver cómo podemos gestionar esos riesgos y mitigarlos de forma efectiva.
-->

---
layout: center
---

<img src="/images/radar.webp" class="h-[26rem] shot" alt="Radar detecting a target">

<!--
El primer riesgo es darles demasiada información o feedback.

Si bloqueamos algo en tiempo real, los adversarios saben al instante que han tocado un punto de detección — y van a empezar a probar hasta entender por qué.

Por eso hay que tener cuidado con qué acciones ejecutamos al momento y cuáles conviene retrasar.

También debemos prestar especial atención a los códigos de error que devolvemos en nuestras APIs y a los mensajes que mostramos al usuario.
-->

---
layout: center
---

<img src="/images/async-enforcement.webp" class="h-[26rem] shot" alt="Ban waves and delayed enforcement">

<!--
Una estrategia bastante efectiva para mitigar este riesgo es la aplicación asíncrona de medidas, a la que ya hicimos referencia en el ejemplo de Riftbound.

En vez de banear cuentas al momento, vamos recopilando evidencia con el tiempo y actuamos en oleadas — por ejemplo, una vez a la semana.

Eso hace mucho más difícil que los adversarios puedan relacionar causa y efecto, sobre todo después de haber invertido recursos en farmear o subir cuentas de nivel.

Aquí también hay una parte económica.

Si las cuentas se banean después de haber sido vendidas, los compradores se quejarán a los vendedores.

Eso daña la reputación de esos marketplaces y mete más fricción del lado del atacante — aunque técnicamente hayan “seguido las reglas”.
-->

---
layout: center
---

<img src="/images/crewmate.png" class="h-[24rem] shot" alt="There is 1 impostor among us">

<!--
El segundo riesgo que quiero destacar es que los adversarios con recursos van a adaptarse.

Con el tiempo, pueden empezar a comportarse cada vez más como jugadores legítimos — hasta el punto de que, si actuamos de forma demasiado agresiva, perdamos visibilidad por completo y ya no podamos distinguirlos de jugadores reales.
-->

---
layout: center
---

<img src="/images/battle.webp" class="h-[26rem] shot" alt="Choosing the battle">

<!--
Eso significa que, a veces, la mejor decisión puede ser no actuar de inmediato.

Si una operación es de bajo riesgo, puede que prefiramos monitorizarla hasta que se convierta en un problema real.

Defender no es solo bloquear, es también es cuestión de timing y de elegir bien el momento para actuar.
-->

---
layout: center
---

<div class="takeaway"><span class="dot">.</span>Every action has a reaction</div>

<!--
Y aquí tenemos la nota mental de esta sección: toda acción tiene una reacción.

Cada bloqueo, cada desafío o cada baneo manda una señal al adversario. Y esa señal puede usarse para hacer ingeniería inversa de nuestras defensas y adaptarse a ellas.

La buena seguridad no va solo de qué hacemos — sino también de cuándo y cómo lo hacemos.
-->

---
layout: cover
class: section centered
---

# Takeaways

<!--
Y para cerrar la charla, vamos a repasar alguno de los conceptos que hemos aprendido hoy.
-->

---
layout: center
---

<div class="flex flex-wrap justify-center gap-4 w-[54rem]">
  <NumberedCard n="01" title="Security has a cost" class="!w-[17rem] !h-[8.5rem]">Business realities, risk and expectations shape security</NumberedCard>
  <NumberedCard n="02" title="Your account is an asset" class="!w-[17rem] !h-[8.5rem]">And valuable assets attract attackers</NumberedCard>
  <NumberedCard n="03" title="Make abuse unprofitable" class="!w-[17rem] !h-[8.5rem]">Economics matter more than perfect security</NumberedCard>
  <NumberedCard n="04" title="Think like the attacker" class="!w-[17rem] !h-[8.5rem]">Security starts with adversarial thinking</NumberedCard>
  <NumberedCard n="05" title="Every action has a reaction" class="!w-[17rem] !h-[8.5rem]">Defensive signals shape adversary behavior</NumberedCard>
</div>

<!--
Estos son las notas mentales que hemos tomado en cada sección.

Pero, si lo condensamos todo aún más.

Aquí están los 2 conceptos que quiero que os llevéis.
-->

---
layout: center
---

<div class="takeaway">Security is a <fluent-emoji-flat-weary-cat class="inline-icon" />and <fluent-emoji-flat-mouse-face class="inline-icon" />game</div>

<img v-click src="/images/cat.png" class="absolute right-14 bottom-12 h-52" alt="Frustrated cat">

<!--
Primero, Seguridad es como el juego del gato y el ratón.

Los atacantes se adaptan. Y nosotros también.

No hay una meta final, no hay un bugfix que salva el día o una victoria permanente.

Los equipos que tienen éxito son aquellos que mantienen la curiosidad y humildad para seguir aprendiendo. Porque en el momento que creemos que ya hemos ganado, el ratón encuentra un agujero nuevo por el que colarse.

Así que aseguraos de que no acabáis como este gato [click] 👆(Animation)  sino como (next slide).
-->

---
layout: center
---

<fluent-emoji-flat-leopard class="big-icon" />

<!--
REEENGARRR!

Sólo quería una excusa para meter Rengar en la presentación.
-->

---
layout: center
---

<div class="takeaway">DON’T aim for perfect security</div>

<!--
Y la otra idea que quiero que os llevéis es …

No intentéis alcanzar la perfección.
-->

---
layout: center
---

<div class="flex flex-col items-center gap-8">
  <img src="/images/make-attacks-unprofitable.gif" class="h-[17rem] shot" alt="">
  <div class="takeaway">Make attacks unprofitable</div>
</div>

<!--
Como en el juego de antes, la seguridad perfecta no es alcanzable porque el tiempo y el dinero no son infinitos ni todas las variables están en nuestro control.

Así que nuestro objetivo no es eliminar los ataques. Sino incrementar su coste. Introducir fricción hasta conseguir que el esfuerzo sea mayor que la recompensa.
-->

---
layout: cover
class: section centered
---

# Wanna help?

<!--
Si os ha parecido interesante y queréis uniros a la batalla, aquí hay algunas ideas de cómo podéis hacerlo.
-->

---

# Protect Your Account

<div class="grid grid-cols-2 gap-5 mt-10">
  <NumberedCard n="1" title="Password Hygiene"><template #icon><fluent-emoji-flat-key /></template>Use an unique secure password. Monitor credential leaks (HaveIBeenPwned)</NumberedCard>
  <NumberedCard n="2" title="Email Verification"><template #icon><fluent-emoji-flat-envelope /></template>Use a real email address and verify it so we can notify you if we detect anomalous activity.</NumberedCard>
  <NumberedCard n="3" title="MFA"><template #icon><fluent-emoji-flat-mobile-phone /></template>Enable MFA (device MFA if possible) so any key account security operations require a second step.</NumberedCard>
  <NumberedCard n="4" title="Protect your Email"><template #icon><fluent-emoji-flat-shield /></template>Make sure you also have high security standard on your email account.</NumberedCard>
</div>

<!--
La mejor manera es asegurándose de tu cuenta está bien protegida. Lo que incluye:

Tener una buena higiene de contraseñas. Es decir, contar con una contraseña única y segura. Con única me refiero a que no reutilices esta contraseña (ni ninguna otra) en múltiples sitios. Hoy en día puedes usar un gestor de contraseñas como Bitwarden, Keeper o LastPass para ello. Además, te recomendaría revisar de vez en cuando HaveIBeenPwned por si alguno de los proveedores que utilizas habitualmente ha sufrido una brecha de seguridad. Por suerte, ya no es tan común que se almacenen contraseñas en texto plano, pero podrían haberse filtrado otros datos personales (PII) que ayuden a los atacantes a robar tu cuenta. Por ejemplo, tu dirección de correo electrónico como pasó con PTV Telecom hace unos años.

Verificación del correo electrónico. Asegúrate de utilizar una dirección de correo real para que podamos notificarte cuando detectemos actividad anómala en tu cuenta.

MFA. Activa la autenticación multifactor (MFA). Preferiblemente a través de Riot Mobile donde recibes una notificación push y listo.

Protege tu correo electrónico. Todo lo anterior no sirve de nada si no mantienes altos estándares de seguridad en tu cuenta de correo. Si un atacante tiene acceso a tu bandeja de entrada, puedes asumir que también tendrá acceso a todo lo demás asociado a ella. Además de hacer todo lo que mencioné antes, también te recomendaría considerar el uso de una llave de seguridad para proteger tu cuenta de correo.
-->

---

# Phishing

<div class="grid grid-cols-2 gap-5">
  <Shot browser src="/images/phishing-new-year.webp" alt="Phishing site: New Year, new loadout" img-class="h-36 object-cover object-top" />
  <Shot browser src="/images/phishing-tenz.webp" alt="Phishing site: fake collaboration" img-class="h-36 object-contain bg-black" />
  <Shot browser src="/images/phishing-valorant-1.webp" alt="Phishing site: free skins" img-class="h-36 object-cover object-top" />
  <Shot browser src="/images/phishing-free-skins.webp" alt="Phishing site: claim your free skins" img-class="h-36 object-cover object-top" />
</div>

<!--
Phishing

¡No caigas en la trampa!

No introduzcas tus credenciales fuera del ecosistema de Riot.

Hoy en día vemos con frecuencia sitios, especialmente a través de redes sociales, que te ofrecen skins o gun buddies gratis. Te garantizo que son estafas al 100%.

Estamos monitoreando continuamente esta actividad para asegurarnos de que que estos sitios sean retirados, pero es un poco el juego del martillo y el topo, quitas uno y salen 20 más.

Así que tened mucho cuidado.
-->

---
layout: center
---

<div class="text-center">
  <div class="eyebrow">HackerOne</div>
  <h1 class="!text-5xl !mb-3">Riot Bug Bounty Program</h1>
  <p class="!text-xl">Find security vulnerabilities and get paid for it</p>
  <div class="mt-8 text-2xl font-mono">
    <a href="https://hackerone.com/riot">https://hackerone.com/riot</a>
  </div>
</div>

<!--
En seguridad, solemos hablar de algo llamado defensa en profundidad.

La idea es sencilla: no dependes de un único control para mantenerte seguro.

En su lugar, superpones capas de defensa — revisiones de diseño, revisiones de código, pruebas automatizadas, protecciones en tiempo de ejecución y monitoreo — de modo que, cuando una capa falla, otras aún puedan detectar el problema.

Los programas de bug bounty encajan en ese modelo como una de las capas más externas.

No son un reemplazo del trabajo interno de seguridad.

En Riot, contamos con un programa de bug bounty bastante activo, a través de la plataforma HackerOne, gestionado por mi equipo, donde investigadores externos de seguridad envían responsablemente sus hallazgos.

Una vez que validamos esos reportes, recompensamos a los investigadores — con dinero real, no con RP — por su tiempo y por ayudarnos a solucionar los problemas en lugar de explotarlos.

Desde que me uní al equipo de seguridad hace dos años, he visto que se han pagado recompensas importantes — en algunos casos, superiores a 50.000 USD.

Así que, si las pruebas de penetración o la investigación en seguridad son algo que te apasiona, definitivamente es algo que vale la pena explorar.
-->

---
layout: cover
class: section centered
---

# Join us!

<!--
Por último, si esta charla te ha inspirado y te apasionan los videojuegos, te animo a que visites nuestra página de empleo para mantenerte al día con las nuevas ofertas de trabajo.

También contamos con un programa de prácticas que se lleva a cabo cada año en Estados Unidos y cada pocos años en Europa.
-->

---
layout: cover
class: cover
---

<div class="eyebrow">HackersWeek 2026</div>

# Risk, Bots and the Business of Breaking Games

<!--
¡Y eso es todo! Espero que les haya parecido interesante y que hayan aprendido algo nuevo hoy. (Next slide)
-->

---
layout: center
---

<div class="flex items-center gap-12">
  <Shot browser src="/images/github-readme.png" alt="Follow-up links README" class="w-[30rem]" />
  <div class="flex flex-col gap-4 max-w-[17rem]">
    <mdi-github class="text-6xl" />
    <a href="https://github.com/albertowar/talks/tree/main/bots-fraud-and-the-business-of-breaking-games" >talks/tree/main/<wbr>bots-fraud-and-the-<wbr>business-of-breaking-games</a>
    <div class="text-[var(--muted)]">@albertowar</div>
  </div>
</div>

<!--
Si algunos os habéis quedado con hambre de más después de esta charla, he preparado en un repository de GitHub una lista de enlaces donde podéis seguir aprendiendo sobre los temas que hemos hablado.
-->

---
layout: cover
class: section centered
---

# Questions?

<!--
Y ahora sí ¿Alguien tiene alguna pregunta?
-->

---
layout: center
---

<div class="flex items-center gap-14">
  <img src="/images/author-avatar.webp" class="h-84 rounded-2xl shot" alt="Alberto Guerra González">
  <div class="flex flex-col gap-4 text-xl">
    <h1 class="!text-5xl">Thank you!</h1>
    <div class="flex items-center gap-3"><fluent-emoji-flat-video-game class="text-3xl" /> Riot p4x0s#EUW</div>
    <div class="flex items-center gap-3"><mdi-linkedin class="text-3xl text-[#0a66c2]" /> albertowar</div>
    <div class="flex items-center gap-3"><mdi-github class="text-3xl" /> albertowar</div>
  </div>
</div>

<!--
Si tenéis más preguntas, o quizá alguna idea para el PFC o la tesis con la que necesitáis ayuda, o queréis echar un ARAM, no dudéis en mandar un mensaje.
-->

---
layout: center
---



---
layout: center
---

<img src="/images/hackersweek-survey.jpg" class="h-[26rem] shot" alt="HackersWeek feedback survey QR code">

<!--
Antes de que se me olvide, aquí tenéis el QR de la encuesta.

Por favor, si tenéis tiempo responder. Estoy muy interesado en saber si os ha gustado la charla y en qué puedo mejorarla.
-->

## **Project parachutist-model**
The first part of the project is to set up mathematical model of a parachutist with a mass of 90kg, which jumps out of an airplane at a height H. The second part of the project is to write functions in files visine.m and grafik.m. Funciton in file visine.m calculates the smallest heights h for opening parachute that guarantee a safe landing for given values of H. Function in file grafik.m draws a graph of the dependence of speed on time for given value H.

### Running the application:
1. Make sure you have MATLAB installed.
2. Clone this project.
3. Go to the project root folder and open functions visine.h and grafik.h in MATLAB.
4. Call the functions as described in *Usage* section.

### Usage:
* Function *visine(H_start, H_step, H_and)* receives three arguments that describe in which interval [*H_start*, *H_end*] and with what step *H_step* you want to calculate the values of h for the values of H from the given interval.
* Choose the values of arguments *H_start, H_step, H_end* and call function *visine(H_start, H_step, H_end)* for that arguments.
* After that, you will get the values of h for that range and a graph of dependence of h on H.  <br /> <br />
  
* Function *grafik(H)* receives one argument *H* for which you want to get a graph of the dependence of speed on time.
* Choose the value of argument *H* and call function *grafik(H)* for that *H*.
* After that, you will get the graph of the dependence of speed on time for that H.


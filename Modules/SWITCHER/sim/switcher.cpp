#include "verilated.h"
#include "VSWITCHER.h"
#include <stdio.h>

void wait_n_cycles(int n);

// Keep track of simulation time (64-bit unsigned)
vluint64_t main_time = 0;

// Called by $time in Verilog an needed to trace waveforms
double sc_time_stamp() {
    return main_time;  // Note does conversion to real, to match SystemC
}

int main(int argc, char ** argv) {

  Verilated::commandArgs(argc, argv);

  Verilated::traceEverOn(true);

  VSWITCHER* top = new VSWITCHER();

  int tcycs = 0;

  top->new_state = 0;
  int le_wait = 0;
  int prev_VNA_TRIG = 1;

  for (int n = 0; n < 8000; n++)
  {   
    top->Clk = 1;
    wait_n_cycles(10);
    top->eval();

    top->Clk = 0;
    wait_n_cycles(10);
    top->eval();
  

    if (tcycs == 2)
    {
      top->new_state = 2;
      top->new_state_arrived = 0;
    }
    else if (tcycs == 3)
    {
      top->new_state = 1;
      top->new_state_arrived = 1;
    }
    else if (tcycs == 500)
    {
      top->new_state = 2;
      top->new_state_arrived = 1;
    }
    else if (tcycs == 900)
    {
      top->new_state = 0;
      top->new_state_arrived = 1;
    }
    else if (tcycs == 7 || tcycs == 650)
    {
      top->new_state = 3;
      top->new_state_arrived = 1;
    }
    else
      top->new_state_arrived = 0;


    // if (tcycs == )
    if (prev_VNA_TRIG == 0 && top->VNA_TRIG == 1)
      le_wait = 50;
    if (le_wait > 0)
      le_wait--;
    if (le_wait >= 1 && le_wait < 4)
      top->VNA_RDY = 1;
    else
      top->VNA_RDY = 0;


    prev_VNA_TRIG = top->VNA_TRIG;

    tcycs++;
    main_time++;  
  }

  delete top;

  exit(0);

}

void wait_n_cycles(int n) {
  for (int i = 0; i < n; i++) { 
    main_time++;
  }
}

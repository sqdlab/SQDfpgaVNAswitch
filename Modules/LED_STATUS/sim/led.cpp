#include "verilated.h"
#include "VLED_STATUS.h"
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

  VLED_STATUS* top = new VLED_STATUS();

  int tcycs = 0;

  for (int n = 0; n < 8000; n++)
  {   
    top->Clk = 1;
    wait_n_cycles(10);
    top->eval();

    top->Clk = 0;
    wait_n_cycles(10);
    top->eval();

    if (tcycs < 130)
      top->state = 0;
    else if (tcycs < 260)
      top->state = 1;
    else if (tcycs < 385)
      top->state = 2;

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

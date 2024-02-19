#include "verilated.h"
#include "VUART_RX.h"
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

  VUART_RX* top = new VUART_RX();

  int data[3] = {45, 83, 56};
  int cur_ind = 0;
  int wait = 8;

  int tcycs = 0;
  
  int cur_bit = 10;
  int cur_data = 0;

  top->RX = 1;
  for (int n = 0; n < 4000; n++)
  {
    top->Clk_UART = 1;
    wait_n_cycles(10);
    top->eval();

    top->Clk_UART = 0;
    wait_n_cycles(10);
    top->eval();

    if (cur_bit == 10)
    {
      if (wait == 0)
      {
        if (cur_ind < 3)
        {
          cur_data = (0x200 | (data[cur_ind++] << 1));
          cur_bit = 0;
        }
      }
      else
        wait--;
    }
    
    if (cur_bit < 10)
    {
      top->RX = (cur_data>>(cur_bit++)) & 1;
      wait = 8;
    }

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

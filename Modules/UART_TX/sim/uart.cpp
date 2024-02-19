#include "verilated.h"
#include "VUART_TX.h"
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

  VUART_TX* top = new VUART_TX();

  int data[3] = {45, 83, 56};
  int cur_ind = 0;

  int tcycs = 0;

  for (int n = 0; n < 8000; n++)
  {
    tcycs = (tcycs+1) % 100;
    if (tcycs < 50)
      top->Clk_UART = 1;
    else
      top->Clk_UART = 0;
    
    top->Clk = 1;
    wait_n_cycles(10);
    top->eval();

    top->Clk = 0;
    wait_n_cycles(10);
    top->eval();

    if (cur_ind < 2)
    {
      top->Data_TX = data[cur_ind++];
      printf("Sending %d\n", top->Data_TX);
      top->send_data = 1;
    }
    else if (n > 2500 && cur_ind < 3)
    {
      top->Data_TX = data[cur_ind++];
      printf("Sending %d\n", top->Data_TX);
      top->send_data = 1;
    }
    else
      top->send_data = 0;

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

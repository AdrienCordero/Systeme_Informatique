#include <stdbool.h>

typedef struct {
  char name[64];
  int addr;
  int val;
  bool is_const;
} var_int_t;

void create_file();

void close_file();

void afc(int address, int val);

void add(int addr, int a, int b);
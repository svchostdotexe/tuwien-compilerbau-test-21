#include <stdio.h>
#include <string.h>
#include <mcheck.h>
#include <stdlib.h>

extern void asma_ref(unsigned long x[], unsigned long y[], unsigned long sum[]);
extern void asma_callchecking(unsigned long x[], unsigned long y[], unsigned long sum[]);

void asma_orig(unsigned long x[], unsigned long y[], unsigned long sum[])
{
  unsigned long carry, sum0;
  sum0 = x[0] + y[0];
  carry = sum0 < x[0];
  sum[0] = sum0;
  sum[1] = x[1] + y[1] + carry;
}

int test(unsigned long x[], unsigned long y[])
{
  int i;
  unsigned long x_ref[2], y_ref[2], sum_ref[2], sum[2];
  for (i = 0; i < 2; i++)
  {
    x_ref[i] = x[i];
    y_ref[i] = y[i];
  }
  printf(" 0x%016lx%016lx\n+0x%016lx%016lx", x[1], x[0], y[1], y[0]);
  asma_callchecking(x, y, sum);
  for (i = 0; i < 2; i++)
  {
    if (x_ref[i] != x[i] || y_ref[i] != y[i])
    {
      printf("\nFehler: Eingabe veraendert\n");
      return 0;
    }
  }
  asma_orig(x, y, sum_ref);
  for (i = 0; i < 2; i++)
  {
    if (sum_ref[i] != sum[i])
    {
      printf("\nFehler: Falsche Ausgabe an Stelle %d: Wert: %016lx, erwartet: %016lx\n", i, sum[i], sum_ref[i]);
      return 0;
    }
  }
  printf("\n=0x%016lx%016lx\n\n", sum[1], sum[0]);
  return 1;
}

/////////////// function insert section start ///////////////
METHODE_CODE
/////////////// function insert section end ///////////////

int main()
{
  unsigned long a[] = {~0L, 3, 1, 4, 0, 1, 1L << 63, 1L << 63};
  int f;

  f = test(a, a + 2);
  f &= test(a, a + 4);
  f &= test(a + 2, a);
  f &= test(a + 6, a + 6);
  f &= test(a + 2, a + 4);
  f &= test(a + 4, a + 2);
  f &= test(a, a + 6);
  f &= test(a + 6, a);
  if (!f)
    fprintf(stdout, "\nTest failed.\n");
  else
    fprintf(stdout, "\nTest succeeded.\n");

  //////////////////// section automation start
  METHODE_CALL_HERE
  fprintf(stdout, "\nCustom test done.\n");
  //////////////////// section automation end

  

  return !f;
}

#include <stddef.h>

extern void asmb(unsigned long x[], unsigned long y[], unsigned long sum[], size_t n);

int main() {
    unsigned long a[] = {~0L, 3, 1, 4, 0, 1, 1L << 63, 1L << 63, ~0, ~0, ~0};
    unsigned long b[] = {~0, ~1, ~0, 1};
    unsigned long sum[1000]; // TODO: make this dynamic

    asmb(a, a + 2, sum, 2);
    asmb(a, a + 4, sum, 2);
    asmb(a + 2, a, sum, 2);
    asmb(a + 6, a + 6, sum, 2);
    asmb(a + 8, a + 8, sum, 3);
    asmb(a, a + 2, sum, 9);
    asmb(a, a + 4, sum, 7);
    asmb(a + 2, a, sum, 9);
    asmb(a + 6, a + 6, sum, 5);
    asmb(a + 8, a + 8, sum, 1);
    asmb(a + 8, a + 8, sum, 0);
    asmb(b, b + 2, sum, 2);
    asmb(b + 2, b, sum, 2);

  return 0;
}

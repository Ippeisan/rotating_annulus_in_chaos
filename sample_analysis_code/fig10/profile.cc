/******************************/
/* Calculation of Gamma and R */
/******************************/

/***** include header file *****/
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

/***** pi *****/
const double pi  = 4.0 * atan(1.0);
const double pi2 = 2.0 * pi;

/***** parameter *****/
const int N = 1024;

/***** main function *****/
int main(int argc, char **argv)
{
  static double Z[N];
  static double F[N];
  static double G[N];
  // phase sensitivity
  double a0 = 0.000222746262093246;
  double a1 = 0.00928592152719472;
  double b1 = 0.00997316094617102;
  double a2 = -0.00113709272830384;
  double b2 = -0.00155901122951355;
  double a3 = 0.000228054540502525;
  double b3 = 0.000398617579735533;

  for (int n = 0; n < N; ++n) {
    double p = pi2 * (double)n / (double)N;
    Z[n]  = a0;
    Z[n] += a1 * cos(1.0 * p);
    Z[n] += b1 * sin(1.0 * p);
    Z[n] += a2 * cos(2.0 * p);
    Z[n] += b2 * sin(2.0 * p);
    Z[n] += a3 * cos(3.0 * p);
    Z[n] += b3 * sin(3.0 * p);
  }
  //
  FILE *fp1, *fp2;
  fp1 = fopen("profile2_dat1.dat", "w");
  fp2 = fopen("profile2_dat2.dat", "w");
  for (int i = 0; i <= N/2; ++i) {
    // forcing profile
    for (int n = 0; n < N; ++n) {
      double p = pi2 * (double)n / (double)N;
      F[n] = 0.5 * (1.0 + cos(p));
    }
    for (int m = -N/2; m <= -N/2+i; ++m) {
      int n = (m + N) % N;
      F[n] = 0.0;
    }
    for (int m = N/2-i; m <= N/2; ++m) {
      int n = (m + N) % N;
      F[n] = 0.0;
    }
    // phase coupling
    for (int n = 0; n < N; ++n) {
      G[n] = 0.0;
      for (int m = 0; m < N; ++m) {
        int mn = (m + n) % N;
        G[n] += Z[mn] * F[m];
      }
      G[n] /= (double)N;
    }
    // max and min
    int nmax = 0;
    int nmin = 0;
    double Gmax = G[0];
    double Gmin = G[0];
    for (int n = 0; n < N; ++n) {
      double Gn = G[n];
      if (Gn > Gmax) {
        nmax = n;
        Gmax = Gn;
      }
      if (Gn < Gmin) {
        nmin = n;
        Gmin = Gn;
      }
    }
    double R = Gmax - Gmin;
    // output
    double d = 100.0 * ((double)N - 2.0 * i) / (double)N;
    for (int n = 0; n < N; ++n) {
      double p = pi2 * (double)n / (double)N;
      fprintf(fp1, "%e %e %e %e\n", d, p, F[n], G[n]);
    }
    fprintf(fp1, "\n");
    fprintf(fp2, "%e %d %d %e %e %e\n", d, nmax, nmin, Gmax, Gmin, R);
  }
  fclose(fp1);
  fclose(fp2);
  return 0;
}

// Licensed under the terms of the GNU GPL v3, or any later version.
//
// Copyright 2019 Nolan Leake <nolan@sigbus.net>
//
// Loosely based on bandwidth2 (originally by Guillaume Coré <fridim@onfi.re>)

#include <getopt.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>

typedef unsigned long long int ulli;

void usage(char *argv[]) {
  printf("Usage: %s "
         "[-t seconds] [-h]\n",
         argv[0]);
  printf("\n");
  printf("-t seconds\trefresh time (default is 1)\n");
  printf("-h \t\tthis help\n");
  printf("\n");
}

ulli get_usage(ulli *used_jiffies) {
  FILE *fd = fopen("/proc/stat", "r");
  ulli user, nice, sys, idle, iowait, irq, sirq, steal, guest, nguest;

  if (!fd) {
    perror("Couldn't open /proc/stat\n");
    exit(EXIT_FAILURE);
  }
  if (fscanf(fd, "cpu  %llu %llu %llu %llu %llu %llu %llu %llu %llu %llu",
             &user, &nice, &sys, &idle, &iowait, &irq, &sirq, &steal, &guest,
             &nguest) != 10) {
    perror("Couldn't read jiffies from /proc/stat\n");
    exit(EXIT_FAILURE);
  }
  fclose(fd);

  *used_jiffies = user + nice + sys + irq + sirq + steal + guest + nguest;
  return *used_jiffies + idle + iowait;
}

int main(int argc, char *argv[]) {
  int t = 1;
  int c;
  char *envvar = NULL;

  envvar = getenv("REFRESH_TIME");
  if (envvar)
    t = atoi(envvar);

  while (c = getopt(argc, argv, "ht:"), c != -1) {
    switch (c) {
    case 't':
      t = atoi(optarg);
      break;
    case 'h':
      usage(argv);
      return EXIT_SUCCESS;
    }
  }

  ulli old_total;
  ulli old_used;

  old_total = get_usage(&old_used);

  ulli used;
  ulli total;
  printf(" ");
  fflush(stdout);

  sleep(t);
  total = get_usage(&used);

  printf("%.0f%%\n", 100.0 * (used - old_used) / (total - old_total));
  fflush(stdout);

  return EXIT_SUCCESS;
}

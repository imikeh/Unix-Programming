#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>

char L[50][40];
int rando(int MAX)
{ struct timeval tv;
  struct timezone tz;
  gettimeofday(&tv,&tz);
  srand(tv.tv_usec);
  return ((rand()>>2)%(MAX));
}

int getnum(int MAX)
{ int i,j,x = rando(MAX);
  for (i=0,j=0;1;i++)
    if (L[i][0]!='\0')
    { if (j==x)
	return i;
      j++;
    }
}

main ()
{ char *c=*L;
  int i,j,r;
  for(i=0;c!=NULL;i++)
     c = gets(L[i]);
  for(j=i-1;j>0;j--)
  { r = getnum(j);
    puts(L[r]);
    L[r][0]='\0';
  }
}

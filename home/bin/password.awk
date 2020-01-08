#!/usr/bin/awk -f

BEGIN {
  srand();
  chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890"
  s="";
  for(i=0;i<16;i++) {
    s = s "" substr(chars, int(rand()*62), 1);
  }
  print s
}

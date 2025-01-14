/*use <key.scad>*/
// NEED to include, not use this, even with the default variables set. don't know why
include <keys.scad>

uhk_profile = [
  [1,1,1,1,1,1,1,1,1,1,1,1,1,1.5],
  [1.5,1,1,1,1,1,1,1,1,1,1,1,1,1],
  [1.75,1,1,1,1,1,1,1,1,1,1,1,1.75],
  [2.25,1,1,1,1,1,1,1,1,1,1,2.25],
  [1.25,1.25,1.25,1.25,1.75,1.75,1.25,1.25,1.25, 2.25]
];

function sum(list, x=0) =
  len(list) <= 1 ?
    x + list[0] :
    sum([for (x = [1: len(list) - 1]) list[x]], x+list[0]);

for (row = [0:len(uhk_profile)-1]){
  for(column = [0:len(uhk_profile[row])-1]) {
    columnDist = sum([for (x = [0 : column]) uhk_profile[row][x]]);
    a = uhk_profile[row][column];
    translate_u(columnDist - (a/2), -row) g20_row(3) u(a) cherry() { // (row+4) % 5 + 1
      if (a == 6.25) {
        spacebar() key();
      } else if (a == 2.25) {
        lshift() key();
      } else if (a == 2) {
        backspace() key();
      } else if (a == 2.75) {
        rshift() key();
      } else {
        key();
      }
    }
  }
}

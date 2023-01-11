int main(){
   int* array = 0x1ABCD004;
   int n = 8;

   for(int i = n; i > n/2; i--){
      array[i] = array[i-n/2] + array[0];
   }
}
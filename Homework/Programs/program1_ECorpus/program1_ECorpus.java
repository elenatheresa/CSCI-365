//import java.util.Random;

/* 
Elena Corpus
CSCI 365 
Program 1 
Write a same program in both Python and Java that fill an array/list with random integer values between
0 and 100 inclusive (think test scores, no bonus points), displays the high score, the low score, and the
average (with 2 places after the decimal point). The array/list should store exactly 20 integers.
*/

class Program1 {
  
    public static void main(final String args[]) {
        // int [] array;
        final int array[] = new int[] { 10, 11, 88, 2, 12, 120 };
        System.out.println(lowValue(array));
        System.out.println(highValue(array));
        System.out.println(averageValue(array));
        //System.out.println(displayPrint(array));
        displayPrint(array);
    }

    /*
     * static void createArray(){ 
     * Random random = new Random(); 
     * for (int i = 0; i < 20; i++)
     * { 
     * int array[i] = (int)random.nextInt(100); 
     * System.out.println(i); 
     * } 
     * }
     */

    public static int lowValue(final int[] array) {
        int minValue = array[0];
        for (int i = 1; i < array.length; i++) {
            if (array[i] < minValue) {
                minValue = array[i];
            }
        }
        return minValue;
    }

    public static int highValue(final int[] array) {
        int maxValue = array[0];
        for (int i = 1; i < array.length; i++) {
            if (array[i] > maxValue) {
                maxValue = array[i];
            }
        }
        return maxValue;
    }

    public static int averageValue(final int[] array) {
        int total = 0;
        for (int i = 1; i < array.length; i++) {
            total = +array[i];
        }
        final int average = total / array.length;
        return average;
    }
    
    static void displayPrint(final int[] array){
        for (int i = 1; i < array.length; i++){
            System.out.println(array);
        
        }
    }
    
}
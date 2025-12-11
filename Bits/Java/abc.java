package Hesprs.Bits.Java;

import java.util.Scanner;

public class abc {
    public static void main(String[] args) {
        int max = Integer.MIN_VALUE;
        int sum = 0;

        Scanner sc = new Scanner(System.in);
        for (int i = 0; i < 10; i++) {
            int temporary = sc.nextInt();
            sum += temporary;
            max = Math.max(max, temporary);
        }
        sc.close();

        sum -= max;
        float average = (float) sum / 9;

        System.out.printf("The max number is %d. The average number excluding max is %.2f.%n", max, average);
    }
}

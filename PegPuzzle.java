public class PegPuzzle {

    static boolean[] isPegThere = new boolean[15];
    static int[][] moves = { {0,1,3},{0,2,5},
                             {1,3,6},{1,4,8},
                             {2,4,7},{2,5,9},
                             {3,6,10},{3,7,12},{3,4,5},
                             {4,7,11},{4,8,13},
                             {5,8,12},{5,9,14},
                             {6,7,8},
                             {7,8,9},
                             {10,11,12},
                             {11,12,13},
                             {12,13,14} };

    private PegPuzzle(int start) {
        System.out.println("Solving puzzle at starting position: " + start);
    }

    private void move() {
        System.out.print("Solving now!");
        System.out.println();
    }

    private void display() {
        for (int i=0; i<5; i++) {
            for (int j=18-i; j>1; j--) {
                System.out.print(" ");
            }
            for (int j=0; j<=i; j++) {
                System.out.print("X ");
            }

            System.out.println();
        }

        System.out.println();
    }
    public static void main(String[] args) {
        System.out.println("Welcome to the Peg Puzzle game!");

        for (int start=0; start<15; start++) {
            PegPuzzle puzzle = new PegPuzzle(start);
            puzzle.move();
            puzzle.display();
        }
    }
}

/*
 * CS:APP Data Lab
 *
 * <George Archbold 604407413>
 *
 * bits.c - Source file with your solutions to the Lab.
 *          This is the file you will hand in to your instructor.
 *
 * WARNING: Do not include the <stdio.h> header; it confuses the dlc
 * compiler. You can still use printf for debugging without including
 * <stdio.h>, although you might get a compiler warning. In general,
 * it's not good practice to ignore compiler warnings, but in this
 * case it's OK.
 */

#if 0
/*
 * Instructions to Students:
 *
 * STEP 1: Read the following instructions carefully.
 */

You will provide your solution to the Data Lab by
editing the collection of functions in this source file.

INTEGER CODING RULES:

  Replace the "return" statement in each function with one
  or more lines of C code that implements the function. Your code
  must conform to the following style:

  int Funct(arg1, arg2, ...) {
      /* brief description of how your implementation works */
      int var1 = Expr1;
      ...
      int varM = ExprM;

      varJ = ExprJ;
      ...
      varN = ExprN;
      return ExprR;
  }

  Each "Expr" is an expression using ONLY the following:
  1. Integer constants 0 through 255 (0xFF), inclusive. You are
      not allowed to use big constants such as 0xffffffff.
  2. Function arguments and local variables (no global variables).
  3. Unary integer operations ! ~
  4. Binary integer operations & ^ | + << >>

  Some of the problems restrict the set of allowed operators even further.
  Each "Expr" may consist of multiple operators. You are not restricted to
  one operator per line.

  You are expressly forbidden to:
  1. Use any control constructs such as if, do, while, for, switch, etc.
  2. Define or use any macros.
  3. Define any additional functions in this file.
  4. Call any functions.
  5. Use any other operations, such as &&, ||, -, or ?:
  6. Use any form of casting.
  7. Use any data type other than int.  This implies that you
     cannot use arrays, structs, or unions.


  You may assume that your machine:
  1. Uses 2s complement, 32-bit representations of integers.
  2. Performs right shifts arithmetically.
  3. Has unpredictable behavior when shifting an integer by more
     than the word size.

EXAMPLES OF ACCEPTABLE CODING STYLE:
  /*
   * pow2plus1 - returns 2^x + 1, where 0 <= x <= 31
   */
  int pow2plus1(int x) {
     /* exploit ability of shifts to compute powers of 2 */
     return (1 << x) + 1;
  }

  /*
   * pow2plus4 - returns 2^x + 4, where 0 <= x <= 31
   */
  int pow2plus4(int x) {
     /* exploit ability of shifts to compute powers of 2 */
     int result = (1 << x);
     result += 4;
     return result;
  }

FLOATING POINT CODING RULES

For the problems that require you to implent floating-point operations,
the coding rules are less strict.  You are allowed to use looping and
conditional control.  You are allowed to use both ints and unsigneds.
You can use arbitrary integer and unsigned constants.

You are expressly forbidden to:
  1. Define or use any macros.
  2. Define any additional functions in this file.
  3. Call any functions.
  4. Use any form of casting.
  5. Use any data type other than int or unsigned.  This means that you
     cannot use arrays, structs, or unions.
  6. Use any floating point data types, operations, or constants.


NOTES:
  1. Use the dlc (data lab checker) compiler (described in the handout) to
     check the legality of your solutions.
  2. Each function has a maximum number of operators (! ~ & ^ | + << >>)
     that you are allowed to use for your implementation of the function.
     The max operator count is checked by dlc. Note that '=' is not
     counted; you may use as many of these as you want without penalty.
  3. Use the btest test harness to check your functions for correctness.
  4. Use the BDD checker to formally verify your functions
  5. The maximum number of ops for each function is given in the
     header comment for each function. If there are any inconsistencies
     between the maximum ops in the writeup and in this file, consider
     this file the authoritative source.

/*
 * STEP 2: Modify the following functions according the coding rules.
 *
 *   IMPORTANT. TO AVOID GRADING SURPRISES:
 *   1. Use the dlc compiler to check that your solutions conform
 *      to the coding rules.
 *   2. Use the BDD checker to formally verify that your solutions produce
 *      the correct answers.
 */


#endif
/* howManyBits - return the minimum number of bits required to represent x in
 *             two's complement
 *  Examples: howManyBits(12) = 5
 *            howManyBits(298) = 10
 *            howManyBits(-5) = 4
 *            howManyBits(0)  = 1
 *            howManyBits(-1) = 1
 *            howManyBits(0x80000000) = 32
 *  Legal ops: ! ~ & ^ | + << >>
 *  Max ops: 90
 *  Rating: 4
 */
int howManyBits(int x) {
       //use the signed bit and the XOR operator to find the positive 
       int sign = x >> 31;
       int temp = sign ^ x;
       
       //designate variables for each halved bit value
       int b16, b8, b4, b2, b1;

       // if x is 0 or -1, we need to return 1
       int zero = !temp;
       // all bits 1 if not 0, used to negate if x is zero
       int notZero = (!(!temp) << 31) >> 31;
  
      //calculate log2n + 2 by splitting each part of the 32 bit number in 
      //half to keep checking if there were necessary bits past each power of 2 
       b16 = !(!(temp >> 16)) << 4;
       temp = temp >> b16;

       b8 = !(!(temp >> 8)) << 3;
       temp = temp >> b8;

       b4 = !(!(temp >> 4)) << 2;
       temp = temp >> b4;

       b2 = !(!(temp >> 2)) << 1;
       temp = temp >> b2;

       b1 = !(!(temp >> 1));

       //add up all the needed bits and 2 more to account for the signed bit
       //and the additional twos complement bit
       temp = b16 + b8 + b4 + b2 + b1 + 2;

       //returns zero, negative one or the total bits required for other
       //numbers
       return zero | (temp & notZero);

}
/*
 * sm2tc - Convert from sign-magnitude to two's complement
 *   where the MSB is the sign bit
 *   Example: sm2tc(0x80000005) = -5.
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 15
 *   Rating: 4
 */
int sm2tc(int x) {
  
  //get the sign of the sign magnitude number
  int sign = x >> 31;

  // use a mask to remove the signed bit from the sign magnitude number
  int mask = (~0 << 31);
  
  //adding x to the twos complement of the mask removes the signed bit
  //give the absolute value of the negative number
  int magnitude_neg = x + (~mask + 1);

  //if the sm number is negative the sign value will be 0 and you want to 
  //the negative version of the magnitude otherwise return 1 and the positve 
  //x  value
  return (sign & (~magnitude_neg + 1)) | (~sign & x);


}
/*
 * isNonNegative - return 1 if x >= 0, return 0 otherwise
 *   Example: isNonNegative(-1) = 0.  isNonNegative(0) = 1.
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 6
 *   Rating: 3
 */
int isNonNegative(int x) {
  
  //get the sign of the value and return the ! value
  return !(x>>31) ;

}

/*
 * rotateRight - Rotate x to the right by n
 *   Can assume that 0 <= n <= 31
 *   Examples: rotateRight(0x87654321,4) = 0x76543218
 *   Legal ops: ~ & ^ | + << >>
 *   Max ops: 25
 *   Rating: 3
 */
int rotateRight(int x, int n) {

  //create a mask of all 1's
  int mask = (~0 << 31) >> 31;
  int mask2 = 0;
  int result = 0;

  //create a mask than can hold the bits that are to be rotated
  mask = mask << n;
  mask = ~(mask);
  mask = mask & x;

  //make the initial shift to result
  result = x >> n;

  //create another mask to clear out the shifted in numbers and avoid sign bias
  mask2 = ~(((~0 << 31) >> n) << 1);
  result = result & mask2;
  
  //shift the rotated bits over to the left
  mask  = mask << (32 + (~n+1));

  //add the rotated bits to the shifted version of x
  return  (mask + result);

}
/*
 * divpwr2 - Compute x/(2^n), for 0 <= n <= 30
 *  Round toward zero
 *   Examples: divpwr2(15,1) = 7, divpwr2(-33,4) = -2
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 15
 *   Rating: 2
 */
int divpwr2(int x, int n) {
  //I cant just assume that >>n will work because of the signed aspect
  //thats why we need to include the bias, which comes from the numbers
  //sign and a mask
  
  int shifted = x >> 31;
  int mask =(1 << n) + ~0;
  int bias = shifted&mask;
  return (x + bias) >> n;

}
/*
 * allOddBits - return 1 if all odd-numbered bits in word set to 1
 *   Examples allOddBits(0xFFFFFFFD) = 0, allOddBits(0xAAAAAAAA) = 1
 *   Legal ops: ! ~ & ^ | + << >>
 *   Max ops: 12
 *   Rating: 2
 */
int allOddBits(int x) {

  //make an odd bit constant
  int mask = 0xAA;
  int check = 0;

  //extend it to a 32 bit mask of 101010...1010
  mask = (mask << 8) + mask;
  mask = (mask << 16) + mask;

  //filter out all the even bits
  check = mask & x;
  
  //XOR to get all 0's if they match the mask
  check = mask ^ check;

  //return !0 if the check matched the mask
  return !check;
}
/*
 * bitXor - x^y using only ~ and &
 *   Example: bitXor(4, 5) = 1
 *   Legal ops: ~ &
 *   Max ops: 14
 *   Rating: 1
 */
int bitXor(int x, int y) {

  //Using DeMorgans law and Bolean logic
  return ~(~(~x & y) & ~(x & ~y));
}
/*
 * isTmin - returns 1 if x is the minimum, two's complement number,
 *     and 0 otherwise
 *   Legal ops: ! ~ & ^ | +
 *   Max ops: 10
 *   Rating: 1
 */
int isTmin(int x) {
  
  //addition assuming wrap semantic would detect Tmin
  return !(x+x) & !!(x);

}

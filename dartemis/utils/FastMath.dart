#library('dartemis');

class FastMath {
  
   static final  PI = Math.PI;
   static final  SQUARED_PI = PI * PI;
   static final  HALF_PI = 0.5 * PI;
   static final  TWO_PI = 2.0 * PI;
   static final  THREE_PI_HALVES = TWO_PI - HALF_PI;

   static final  _sin_a = -4 / SQUARED_PI;
   static final  _sin_b = 4 / PI;
   static final  _sin_p = 9.0 / 40;

   static final _asin_a = -0.0481295276831013447;
   static final _asin_b = -0.343835993947915197;
   static final _asin_c = 0.962761848425913169;
   static final _asin_d = 1.00138940860107040;

   static final _atan_a = 0.280872;

   static  double cos(final double x) {
    return sin(x + ((x > HALF_PI) ? -THREE_PI_HALVES : HALF_PI));
  }

  static double sin(double x) {
    x = _sin_a * x * abs(x) + _sin_b * x;
    return _sin_p * (x * abs(x) - x) + x;
  }

  static double tan(final double x) {
    return sin(x) / cos(x);
  }

  static double asin(final double x) {
    return x * (abs(x) * (abs(x) * _asin_a + _asin_b) + _asin_c) + signum(x) * (_asin_d - Math.sqrt(1 - x * x));
  }

  static double acos(final double x) {
    return HALF_PI - asin(x);
  }

  static double atan(final double x) {
    return (abs(x) < 1) ? x / (1 + _atan_a * x * x) : signum(x) * HALF_PI - x / (x * x + _atan_a);
  }

//  static double inverseSqrt(double x) {
//    final double xhalves = 0.5 * x;
//    x = Double.longBitsToDouble(0x5FE6EB50C7B537AAl - (Double.doubleToRawLongBits(x) >> 1)); 
//    return x * (1.5 - xhalves * x * x); // more iterations possible
//  }
//
//  static double sqrt(final double x) {
//    return x * inverseSqrt(x);
//  }
//    
  static num abs(num x) {
      return (x < 0) ? -x : x;
  }
  
  static double signum(num x) {
    return (x < 0) ? -1.0 : (x > 0) ? 1.0 : 0;
}
  
}

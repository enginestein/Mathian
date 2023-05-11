package sigmath;

import com.aspose.ms.System.NotImplementedException;
import com.aspose.ms.System.ObjectExtensions;
import com.aspose.ms.lang.Struct;

public class Compl {
    
    public static class Complex extends Struct<Complex> {
        private final double real;
        private final double imaginary;
        
        public Complex(double real, double imaginary) {
            this.real = real;
            this.imaginary = imaginary;
        }
        
        public double getReal() {
            return real;
        }
        
        public double getImaginary() {
            return imaginary;
        }
        
        public static Complex add(Complex a, Complex b) {
            return new Complex(a.getReal() + b.getReal(), a.getImaginary() + b.getImaginary());
        }
        
        public static Complex subtract(Complex a, Complex b) {
            return new Complex(a.getReal() - b.getReal(), a.getImaginary() - b.getImaginary());
        }
        
        public static Complex multiply(Complex a, Complex b) {
            return new Complex(
                a.getReal() * b.getReal() - a.getImaginary() * b.getImaginary(),
                a.getReal() * b.getImaginary() + a.getImaginary() * b.getReal()
            );
        }
        
        public static Complex divide(Complex a, Complex b) {
            double denominator = b.getReal() * b.getReal() + b.getImaginary() * b.getImaginary();
            double numeratorReal = a.getReal() * b.getReal() + a.getImaginary() * b.getImaginary();
            double numeratorImaginary = a.getImaginary() * b.getReal() - a.getReal() * b.getImaginary();
            
            return new Complex(numeratorReal / denominator, numeratorImaginary / denominator);
        }
        
        public static double abs(Complex a) {
            return Math.sqrt(a.getReal() * a.getReal() + a.getImaginary() * a.getImaginary());
        }
        
        public static double magnitude(Complex number) {
            return Math.sqrt(number.getReal() * number.getReal() + number.getImaginary() * number.getImaginary());
        }
        
        @Override
        public boolean equals(Object obj) {
            if (ObjectExtensions.referenceEquals(null, obj)) {
                return false;
            }
            if (ObjectExtensions.referenceEquals(this, obj)) {
                return true;
            }
            if (!(obj instanceof Complex)) {
                return false;
            }
            
            Complex that = (Complex) obj;
            return this.real == that.real && this.imaginary == that.imaginary;
        }
    }
}

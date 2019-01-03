package cz.jiripinkas.jba.util;

public class Get4Checks {
	
	public static long[] generateFrom(long i) {
		// TODO Auto-generated method stub
		long tmpamt = i;

		long[] a = new long[4];

		if (tmpamt >= 2000) {
			long amtdiv = tmpamt / 4;
			long amtrem = amtdiv % 500;
			if (amtdiv % 500 == 0) {
				a[0] = a[1] = a[2] = a[3] = amtdiv;
			} else {
				long k = amtrem * 4;
				tmpamt = tmpamt - k;
				a[0] = a[1] = a[2] = a[3] = tmpamt / 4;
				a[0] = a[0] + k;
			}

		}
		return a;

	}

}

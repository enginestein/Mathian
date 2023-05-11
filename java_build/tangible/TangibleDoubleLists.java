package tangible;//----------------------------------------------------------------------------------------//	Copyright © 2007 - 2023 Tangible Software Solutions, Inc.//	This class can be used by anyone provided that the copyright notice remains intact.////	This class is used to convert between Double Lists and double arrays.//----------------------------------------------------------------------------------------public final class DoubleLists{	public static double[] toArray(java.util.List<Double> list)	{		double[] array = new double[list.size()];		for (int i = 0; i < list.size(); i++)		{			array[i] = list.get(i).doubleValue();		}		return array;	}	public static void addPrimitiveArrayToList(double[] array, java.util.List<Double> list)	{		for (int i = 0; i < array.length; i++)		{			list.add(array[i]);		}	}	public static void addPrimitiveArrayToList(int index, double[] array, java.util.List<Double> list)	{		for (int i = 0; i < array.length; i++)		{			list.add(index + i, array[i]);		}	}}

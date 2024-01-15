using System;
using ScottPlot;

class Plotter
{
    // Function to plot an equation on a graph and save it as a PNG file
    public static void PlotEquation(Func<double, double> equation, double xMin, double xMax, int pointCount = 1000)
    {
        double[] x = GenerateXValues(xMin, xMax, pointCount);
        double[] y = GenerateYValues(equation, x);

        // Create a new Plot object
        var plt = new ScottPlot.Plot();

        // Plot the equation
        plt.PlotScatter(x, y, markerSize: 0, label: "Equation");

        // Add labels and title
        plt.Title("Plot of Equation");
        plt.XLabel("X");
        plt.YLabel("Y");

        // Show the legend
        plt.Legend();

        // Save the plot as a PNG file
        plt.SaveFig("graph.png");
    }

    // Function to generate X values
    private static double[] GenerateXValues(double xMin, double xMax, int pointCount)
    {
        double[] x = new double[pointCount];
        double step = (xMax - xMin) / (pointCount - 1);

        for (int i = 0; i < pointCount; i++)
        {
            x[i] = xMin + i * step;
        }

        return x;
    }

    // Function to generate Y values based on the equation
    private static double[] GenerateYValues(Func<double, double> equation, double[] xValues)
    {
        double[] yValues = new double[xValues.Length];

        for (int i = 0; i < xValues.Length; i++)
        {
            yValues[i] = equation(xValues[i]);
        }

        return yValues;
    }

    //static void Main()
    //{
        //PlotEquation(x => 2 * x * x - 3 * x + 1, -5, 5);
    //}
}

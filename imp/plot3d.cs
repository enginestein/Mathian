using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using OxyPlot;
using OxyPlot.Axes;
using OxyPlot.Series;
using OxyPlot.WindowsForms;

namespace Sigmath
{
    class Plot3D
    {
        public static void Plot(Func<double, double, double> equation, double xMin, double xMax, double yMin, double yMax, int pointCount = 100)
        {
            var plotModel = new OxyPlot.PlotModel();
            plotModel.Axes.Add(new OxyPlot.Axes.LinearAxis { Position = OxyPlot.Axes.AxisPosition.Bottom });
            plotModel.Axes.Add(new OxyPlot.Axes.LinearAxis { Position = OxyPlot.Axes.AxisPosition.Left });
            plotModel.Axes.Add(new OxyPlot.Axes.LinearColorAxis { Position = OxyPlot.Axes.AxisPosition.Right });

            var xValues = GenerateValues(xMin, xMax, pointCount);
            var yValues = GenerateValues(yMin, yMax, pointCount);

            var series = new OxyPlot.Series.HeatMapSeries
            {
                X0 = xMin,
                X1 = xMax,
                Y0 = yMin,
                Y1 = yMax,
                Data = GenerateHeatMapData(equation, xValues, yValues, pointCount)
            };

            plotModel.Series.Add(series);

            var plotView = new OxyPlot.WindowsForms.PlotView
            {
                Model = plotModel,
                Width = 800,
                Height = 600
            };

            var form = new System.Windows.Forms.Form();
            form.Controls.Add(plotView);

            // Show the plot
            form.ShowDialog();
        }

        private static double[] GenerateValues(double min, double max, int pointCount)
        {
            double[] values = new double[pointCount];
            double step = (max - min) / (pointCount - 1);

            for (int i = 0; i < pointCount; i++)
            {
                values[i] = min + i * step;
            }

            return values;
        }

        private static double[,] GenerateHeatMapData(Func<double, double, double> equation, double[] xValues, double[] yValues, int pointCount)
        {
            double[,] data = new double[pointCount, pointCount];

            for (int i = 0; i < pointCount; i++)
            {
                for (int j = 0; j < pointCount; j++)
                {
                    data[i, j] = equation(xValues[i], yValues[j]);
                }
            }

            return data;
        }

        // Example usage
        //static void Main()
        //{
            // Example: Plotting the 3D equation z = (sin(4*x) - cos(5*y))/5
            //Plot((x, y) => (Math.Sin(4 * x) - Math.Cos(5 * y)) / 5, -5, 5, -5, 5);
        //}
    }
}

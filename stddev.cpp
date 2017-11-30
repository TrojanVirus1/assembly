#include<iostream>
#include<cmath>
#include<iomanip>


double average(double *array,int size)
{
    double total = 0.0;
    for(int i=0;i<size;i++)
        total += array[i];
    return total / size;
}

double stddev(double *array,int size)
{
    double avg = average(array,size);
    double total = 0.0;
    for(int i=0;i< size; i++)
    {
        double v = array[i] - avg;
        total += v*v;
    }
    return sqrt(total/size);
}

int main()
{
    double values[100];
    double total = 0.0;
    int index = 0;
    double v;
    while(std::cin >> v)
    {
        values[index] = v;
        index++;
    }
    std::cout << std::setprecision(10);
    std::cout << stddev(values,100) << std::endl;


    return 0;
}

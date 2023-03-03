import matplotlib.pyplot as plt
import os

PATH = 'cmake-build-debug/benchmark/'


def main():
    for benchmark in filter(
            lambda n: n.endswith('.txt'), os.listdir(PATH)):
        print("Reading data from", benchmark)
        with open(PATH + benchmark, 'r') as f:
            subject = benchmark.split('.')[0]
            dummy, *amounts = f.readline().split()
            series_m1, *m1_data = f.readline().split()
            series_m2, *m2_data = f.readline().split()

            m1_data = [str(int(m) // 1000) + 'ms' for m in m1_data]
            m2_data = [str(int(m) // 1000) + 'ms' for m in m2_data]
            amounts = [str(int(a) // 1000) + 'k' for a in amounts]

            print("Presenting data for", subject)
            plt.plot(amounts, m1_data, 'o-', label=series_m1)
            plt.plot(amounts, m2_data, 'o-', label=series_m2)
            plt.ylabel('Time (milliseconds)')
            plt.xlabel('Time of iterations')
            plt.title(subject)
            plt.legend()

            # Weird hack to show values on top of the points
            for i, (v1, v2) in enumerate(zip(m1_data, m2_data)):
                plt.text(amounts[i], v1, str(v1), ha='center')
                plt.text(amounts[i], v2, str(v2), ha='center')
            plt.savefig(PATH + subject + '.png')
            plt.clf()


main()

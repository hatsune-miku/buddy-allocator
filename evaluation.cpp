#include "rtos-alloc.h"

#include <libgrading.h>
#include <iomanip>
#include <fstream>
#include <future>
#include <ostream>
#include <filesystem>

using namespace grading;


const TestSuite tests = {
    {
        "basic allocation",
        "",
        []() {
            void* p = rtos_malloc(8);
            CheckNonNull(p, "allocated pointer should not be NULL");
        }
    },
};

template <typename T>
std::ostream& operator<<(std::ostream& os, const std::vector<T>& v)
{
    for (auto it = v.begin(); it != v.end(); ++it) {
        os << *it;
        if (it != v.end() - 1)
            os << " ";
    }
    return os;
}

void measure(
    const char* subject,
    const char* m1,
    const char* m2,
    const std::function<int(int)> &f1,
    const std::function<int(int)> &f2)
{
    std::cout << "Subject: " << subject << std::endl;
    std::vector<unsigned long long> data_amount;
    std::vector<unsigned long long> times1;
    std::vector<unsigned long long> times2;

    for (int i = 0; i < 10; ++i) {
        auto start = std::chrono::high_resolution_clock::now();
        data_amount.push_back(f1(i + 1));
        auto end = std::chrono::high_resolution_clock::now();
        times1.push_back(std::chrono::duration_cast<std::chrono::microseconds>(end - start).count());

        start = std::chrono::high_resolution_clock::now();
        f2(i + 1);
        end = std::chrono::high_resolution_clock::now();
        times2.push_back(std::chrono::duration_cast<std::chrono::microseconds>(end - start).count());
    }

    std::filesystem::create_directory("benchmark");
    std::fstream f(std::string("benchmark/") + subject + ".txt", std::ios::out);
    f << "amount " << data_amount << "\n" << m1 << " " << times1 << "\n" << m2 << " " << times2;
    f.close();
}

int main2(int argc, char* argv[])
{
#define BENCHMARK(name, proc) do {\
    auto name = [](int n, void* (* alloc)(size_t), void(* dealloc)(void*)) -> int { \
        proc \
    }; measure(#name, "malloc", "rtos_malloc", [&](int n) { return name(n, malloc, free); }, [&](int n) { return name(n, rtos_malloc, rtos_free); }); } while (0)

    BENCHMARK(integer_of_100_000, {
        for (int i = 0; i < 10000 * n; i++) {
            int* ptr = (int*) alloc(sizeof(int));
            *ptr = i;
            dealloc(ptr);
        }
        return 10000 * n;
    });

    BENCHMARK(integer_of_1000x100000, {
        for (int i = 0; i < 100000 * n; i++) {
            int* ptr = (int*) alloc(1000 * sizeof(int));
            *ptr = i;
            dealloc(ptr);
        }
        return 100000 * n;
    });

    BENCHMARK(larger_arrays, {
        int* ptr = (int*) alloc(5000ULL * n * sizeof(int));
        for (int i = 0; i < 5000; i++)
            ptr[i] = i;
        dealloc(ptr);
        return 5000 * n;
    });


    // const TestSuite::Statistics stats = tests.Run(argc, argv);
    // std::cout << "Score: " << (2 + 5 * stats.score) << "/7" << std::endl;

    return 0;
}

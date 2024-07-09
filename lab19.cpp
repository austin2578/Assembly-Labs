#include <iostream>
#include <cstring>

using namespace std;

extern "C" int String_length(char*);

int main() {
    char str[] = "Cat in the hat.";

    // Using C++ string and strlen function
    cout << "C++ String: " << str << endl << " C++ String length= " << strlen(str) << endl;

    // Using assembly language function String_length
    cout << "ASM length= " << String_length(str) << endl;

    return 0;
}
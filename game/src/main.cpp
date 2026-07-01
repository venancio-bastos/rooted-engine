#include <rooted/Rooted.h>

__declspec(dllimport) void PrintMessage(const char* str);

int main()
{
	PrintMessage("Hello from Kill or Die!");
	std::cin.get();
	return 0;
}
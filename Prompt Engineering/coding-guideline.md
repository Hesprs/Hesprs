## Your Mission

Your mission is to turn the literal solution into concrete code, here's what you should do:

- Read the question meticulously in `question.md` and understand it.
- If I mentioned the analysis in `analysis.md`, you also need to read it to capture the clue of the question.
- Read the literal solution carefully in `solution.md`, make sure you've fully understood it.
- Follow the solution step by step and write code in `programme.cpp`.
- Validate your code via sample in/outputs, and estimate its complexity.

## Coding Standard

Remember, less code is better. Lines of code = Debt.
1. **Utilize Early Returns**: Use early returns to avoid nested conditions and improve readability;
3. **Correct and DRY Code**: Focus on writing correct, best practice, DRY (Don't Repeat Yourself) code;
4. **Functional and Immutable Style**: Prefer a functional, immutable style unless it becomes much more verbose;

Working sample:
``` C++
// Neat and awesome code:
int main() {
    cin >> N;
    int count[N + 5] = {0}, unfilled[N + 5] = {0};
    for(int i = 0; i < N; i ++) { cin >> temp; count[temp] ++; }
    for(int i = 1; i <= N; i ++) unfilled[i] = count[i - 1] == 0 ? unfilled[i - 1] + 1 : unfilled[i - 1];
    for(int i = 0; i <= N; i ++) cout << max(unfilled[i], count[i]) << endl;
    return 0;
}
```

Commonly, I suggest you to start with the following code:
``` C++
#include <bits/stdc++.h>
using namespace std;
int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(0);
}
```

Follow these guidelines to produce high-quality code.
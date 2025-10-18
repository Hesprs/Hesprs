Your mission is to create a detailed and efficient algorithm to solve the Algorithm Symposium puzzle, here's what you should do:

- Read the question in `question.md`.
- If I mentioned the analysis in `analysis.md`, you also need to read it meticulously to capture the clue of the question. It should mention multiple methods, choose the one with the best performance as your algorithm.
- Reason deeply, consider comprehensively to conceive a concrete algorithm of the problem, you need to consider a variety of algorithm tricks and border cases. Here're some useful directions:
    - **Split task**: some puzzles cannot be handled by single step, you need to progressively approach it.
    - **Algorithm search and deployment**: identify the functionality you want to achieve in each step and search for the best sub-algorithm for it.
    - **Optimization**: Always try to design the most performant algorithm with the least time complexity.
- Check whether the logic it fits your mind and the question, use sample input/output to test it.
- Write down your final algorithm literally though words step by step, but don't write code. Save your algorithm in `solution.md` in the same directory, it needs to be in Markdown format, use the template below:

# Solution for (the title of the question)

## Strategy

(briefly conclude how does your algorithm solve the question)

---

## Steps for case 1

(when it fits case one)

**Input**:
- Task: get input.
- Example:
```
(choose a sample input and list here)
```

**Step 1: (step 1 name)**:
- Task: (Its task)
- Description: (Detailed description)
- Example: (How the sample input you mentioned above will be processed in this step)

**Step 2: (step 2 name)**:
- Task: (Its task)
- Description: (Detailed description)
- Example: (How the sample input you mentioned above will be processed in this step)

...

**Output**:
- Task: output the answer
- Example:
```
(list the corresponding sample output)
```

---

## (Optional, if their is other cases) Steps for case 2

(the same template like in Steps for case 1)

...
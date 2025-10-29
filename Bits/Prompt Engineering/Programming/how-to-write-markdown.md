I find you always use the wrong Markdown syntax, so I will correct some of you mistakes:

- If you want to type inline Latex, don't use \(...\) (parenthesis with back slashes) or `...` (double backticks) as wrappers, **use $...$ (two dollar signs) instead**.
- If you want to use a Latex span, don't use \[...\] (square brackets with back slashes) as wrappers, **use $$...$$ (four dollar signs) instead**, for example:
    $$
    B_{i,j}=R_i+C_j\qquad(1\le i,j\le N)\tag{1}
    $$
- Don't use any `&nbsp;`(non-break-space sign), directly use a space ` ` instead.
- If you want to crate a horizontal division, use `---`(three dashes); if you want to create a level-1-heading, use `# ...`(a pound sign), don't add dashes below the heading!
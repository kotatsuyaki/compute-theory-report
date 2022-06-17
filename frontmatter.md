---
# vim: set ft=markdown.pandoc colorcolumn=100:

title: '計算理論期末報告'
subtitle: 'Theory of Computation, NTHU'
author: '107021129 黃明瀧'
date: 2022-06-17
fontsize: 12pt

maketitle: true
colorlinks: true

# 引用之「圖x」
figPrefix: 圖

reference-section-title: 引用

header-includes:
  - |
    \usepackage{amsthm}
    \newtheorem*{thm}{定理}
    \newtheorem*{lem}{引理}
  - |
    ```{=latex}
    \AtBeginDocument{%
    \addto\captionsenglish{\renewcommand{\figurename}{圖}}
    }
    ```
  - |
    \DeclareMathOperator{\TM}{\mathsf{TM}}
    \DeclareMathOperator{\NTM}{\mathsf{NTM}}


---
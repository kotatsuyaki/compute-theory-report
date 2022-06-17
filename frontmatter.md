---
# vim: set ft=markdown.pandoc colorcolumn=100:

title: '計算理論期末報告'
subtitle: 'Theory of Computation, NTHU'
author: '107021129 黃明瀧'
date: 2022-06-17
fontsize: 11pt

abstract: |
  此份報告的內容基於教科書[@i2toc]編寫，
  符號與定義多與教科書相同。
  部分證明細節取自上課教材[@wkhontoc]。

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
    \DeclareMathOperator{\ITM}{\mathsf{INFINITE}_{\mathsf{TM}}}
    \DeclareMathOperator{\ATM}{\mathit{A}_{\mathsf{TM}}}
    \DeclareMathOperator{\PCP}{\mathsf{PCP}}
    \DeclareMathOperator{\Lang}{L}
  - |
    \usepackage{mathtools}
    \DeclarePairedDelimiter{\Desc}{\langle}{\rangle}
    \newcommand{\Domino}[2]{\Bigg[\displaystyle\frac{\mathtt{#1}}{\mathtt{#2}}\Bigg]}
    \newcommand{\DominoS}[2]{\Bigg[\displaystyle\frac{#1}{#2}\Bigg]}
    \newcommand{\DominoL}[2]{\left[\frac{\mathtt{#1}}{\mathtt{#2}}\right]}

amsthm:
  counter_depth: 0
  definition:
    - 定義
  plain:
    - Theorem:
      - 定理
      - 引理
      - 推論
  counter_ignore_headings:
    - List of Figures
    - List of Tables
    - List of Listings
---

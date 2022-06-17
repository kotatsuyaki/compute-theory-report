# $\TM = \NTM$

::: {.定理 info="$\TM = \NTM$"}
給定任意的非確定型圖靈機[^1]$N$，
存在確定型圖靈機[^2]$D$使得$L(N) = L(D)$。
:::

::: {.proof}
令$N$為一非確定型圖靈機。
已知多帶圖靈機[^3]與確定型圖靈機具有相同的計算能力，
故若我們可以建構出多帶圖靈機$D$使得$L(N) = L(D)$，
則定理得證。
以下我們以一多帶圖靈機$D$來模擬$N$的運算。

令$D$為一包含三條紙帶的多帶圖靈機，其中

- 紙帶1記錄原始輸入字串$\omega$。
- 紙帶2記錄模擬的過程；類似於記憶體。

  舉例來說，`0#01`代表目前紙帶上的字串為`001`，
  且讀寫頭位於第二個字符的位置。
- 紙帶3記錄在計算樹[^4]應選擇的分支。

  舉例來說，`231`代表應依序選擇根節點的第二個子節點
  、該子節點的第三個子節點
  、該子節點的第一個子節點來做運算。

紙帶3的字符集合$\Gamma_b$大小由$N$的計算樹的分歧度[^5]$b$所決定。
$b$可以由$N$的狀態集及字符集推得。

$$b = \Big |Q \times \Gamma \times \{ L, R \} \Big|$$

以下給出$D$的演算法文字敘述。對於輸入字串$\omega$，

1. 將$\omega$寫至紙帶1。初始化紙帶2及3為空。
2. 複製紙帶1的內容至紙帶2，作為模擬用的輸入字串。
3. 依照紙帶3記錄的內容，在紙帶2上模擬$N$的運算。
   在模擬每一步驟之前，確認以下條件。

   a. 根據$N$之轉移函數$\delta$，若此步驟為非法，則跳至步驟4。
   b. 若紙帶3上已無任何字符，則跳至步驟4。
   c. 根據$N$之拒絕狀態$q_\text{reject}$，若目前模擬的狀為為拒絕狀態，則拒絕。
   d. 根據$N$之接受狀態$q_\text{accept}$，若目前模擬的狀態為接受狀態，則接受。
4. 依照字典序，將紙帶3上的字串改為下一個字串。跳至步驟2。

上述多帶圖靈機$D$會依序模擬$N$執行0步$\to$執行1步$\to$執行2步……，
以廣度優先的方式嘗試所有運算路徑，
故$D$接受（拒絕）字串$\omega$若且唯若$N$接受（拒絕）字串$\omega$。
因此，$L(N) = L(D)$。
:::


[^1]: 非確定型圖靈機 = Nondeterminstic Turing machine
[^2]: 確定型圖靈機 = Deterministic Turing machine
[^3]: 多帶圖靈機 = Multitape Turing machine
[^4]: 計算樹 = Computation tree
[^5]: 分歧度 = Degree


# Rice Theorem

::: {.定理 info="Rice's Theorem"}
令 $P$ 為一語言，使得下列兩條件成立，則 $P$ 是不可判定[^6]的。

1. $P$ 是非平凡[^7]的；
   亦即存在圖靈機 $M$使得$\Desc{M} \in P$，
   但不是所有的圖靈機的敘述都屬於 $P$。
2. $P$ 是語言的性質；
   亦即若 $\Lang(M_1) = \Lang(M_2)$，

   則 $\Desc{M_1} \in P \Leftrightarrow \Desc{M_2} \in P$。
   換句話說，一個圖靈機的敘述是否屬於 $P$，
   只與該圖靈機對應的語言有關。
:::

::: {.proof}
我們以反證法證明 Rice's Theorem。
假設 $P$ 是可判定的。
令 $M_P$ 為判定 $P$ 的圖靈機。
我們將使用 $M_P$ 來建構出可判定 $\ATM$ 的圖靈機。

令 $T_\emptyset$ 為一拒絕所有輸入的圖靈機。$\Lang(T_\emptyset) = \emptyset$。
不失一般性[^8]，假設 $\Desc{T_\emptyset} \not \in P$。
由條件1，令 $T$ 為圖靈機，使得 $\Desc{T} \in P$。

利用 $P$ 可以「分辨」出 $T_\emptyset$ 與 $T$ 之間差異的能力，
對於輸入 $\Desc{M, \omega}$，設計以下圖靈機 $S$ ，作為 $\ATM$ 的判定器。

1. 利用 $M$ 與 $\omega$ 來建構圖靈機 $M_\omega$：

   對於輸入 $x$，

   a. 以 $\omega$ 作為輸入模擬 $M$ 的執行。
      若 $M$ 拒絕，則拒絕。
   b. 以 $x$ 作為輸入模擬 $T$ 的執行。
      若 $T$ 接受，則接受。
2. 以 $R_P$ 來判斷 $\Desc{M_\omega}$ 是否屬於 $P$。
   若 $\Desc{M_\omega} \in P$，則接受。
   若 $\Desc{M_\omega} \not \in P$，則拒絕。

為什麼 $S$ 可以判定 $\ATM$ 呢？
我們可以討論兩種情形，分析 $S$ 的行為。

- 若 $M$ 接受 $\omega$ ，則 $M_\omega$ 會進入步驟 1b 
  $\implies \Lang(M_\omega) = \Lang(T)$
  $\implies \Desc{M_\omega} \in P$
- 若 $M$ 拒絕 $\omega$ ，則 $M_\omega$ 會拒絕所有輸入字串 $x$
  $\implies \Lang(M_\omega) = \Lang(T_\emptyset)$
  $\implies \Desc{M_\omega} \not \in P$

我們可以看出 $\Desc{M_\omega} \in P$ 若且唯若 $M$ 接受 $\omega$，
因此 $S$ 可以判定 $\ATM$。
然而已知 $\ATM$ 是一個不可判定的語言，
所以此為矛盾 $\implies P$ 不可判定。
:::

以下舉例說明如何使用 Rice's Theorem
證明 $\ITM = \Big\{ \Desc{M} \Big | |\Lang(M)| = \infty \Big\}$ 的不可判定性。

::: {.proof}
要使用 Rice's Theorem，我們需要驗證 $\ITM$ 是否符合定理的兩個前提。

1. 令 $T_{\text{all}}$ 為接受所有輸入字串的圖靈機。
   因 $\Desc{ T_{\text{all}} } \in \ITM$ 且 $\Desc{ T_\emptyset } \not \in \ITM$，
   故 $\ITM$ 是非平凡的。
2. $\ITM$ 的定義只與 $\Lang(M)$ 有關，
   故 $\ITM$ 是語言的性質。

$\ITM$ 符合 Rice's Theorem 的兩個前提，因此 $\ITM$ 是不可判定的。
:::

[^6]: 不可判定 = Undecidable
[^7]: 非平凡 = Nontrivial
[^8]: 若 $\Desc{T_\emptyset} \in P$，
      則整個證明可以改以 $\overline{P}$ 來進行，
      使得 $\Desc{T_\emptyset} \not \in P$。


# Post Correspondence Problem

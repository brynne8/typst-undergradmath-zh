// Meta data
#set document(title: "Typst Math for Undergrads", author: "johanvx")

// Margin
#set page(margin: 0.5in)

// Font size
#let scriptsize = 7pt
#let normalsize = 10pt
#let large = 12pt
#set text(
  size: normalsize,
  lang: "zh",
  font: ("Linux Libertine", "Noto Serif CJK SC")
)
#show raw: set text(
  font: ("DejaVu Sans Mono", "Alibaba PuHuiTi 2.0")
)

// Some horizontal spacing
#let kern(length) = h(length, weak: true)
#let enspace = kern(0.5em)

// For table/grid, something like "lhs \enspace rhs"
#let cell(lhs, rhs) = box(lhs + enspace + rhs)
// Grid for code blocks
#set grid(columns: (2em, auto))
// Table for math-code listing
#set table(stroke: none, align: horizon + left, inset: 0pt, row-gutter: 0.45em)

// LaTeX and TeX logos
#let TeX = style(styles => {
  let e = measure(text(normalsize, "E"), styles)
  let T = "T"
  let E = text(normalsize, baseline: e.height / 2, "E")
  let X = "X"
  box(T + kern(-0.1667em) + E + kern(-0.125em) + X)
})
#let LaTeX = style(styles => {
  let l = measure(text(10pt, "L"), styles)
  let a = measure(text(7pt, "A"), styles)
  let L = "L"
  let A = text(7pt, baseline: a.height - l.height, "A")
  box(L + kern(-0.36em) + A + kern(-0.15em) + TeX)
})

// Update date
#let date = "2023-09-16"

// Unavailable (last check date)
#show "??": box(text(red, [v#sys.version #emoji.crossmark]))
// Tricky
#show "!!": box(text(blue, emoji.drops))
// No idea
#show "?!": box(text(orange, [No idea #emoji.face.unhappy]))
// Tricky figure numbering
#set figure(numbering: n => {
  ([??], [!!], [?!]).at(n - 1)
})
// No prefix
#set ref(supplement: "")

// Justified paragraphs
#set par(justify: true)

// Two-column body
#show: rest => columns(2, rest)

// headcolor
#let headcolor = rgb("004225")

// Run-in sections, like LaTeX \paragraph
#show heading.where(
  level: 1
): it => text(
  size: normalsize,
  weight: "bold",
  fill: headcolor,
  font: ("Linux Libertine", "Alibaba PuHuiTi 2.0"),
  it.body + h(0.67em)
)

// Title
#align(center, link("https://github.com/johanvx/typst-undergradmath")[
  #text(large, headcolor, font: ("Linux Libertine", "Alibaba PuHuiTi 2.0"))[*Typst 大学数学*]
])

// Put this here to avoid affecting the title
#show link: underline

这是 Jim Hefferon 的《本科生 #LaTeX 数学》的 Typst 版本，适用的 typst 版本为 #sys.version。
原始版本可以在此链接中找到：#link("https://gitlab.com/jim.hefferon/undergradmath")。

= 记号的含义
#figure(
  table(
    columns: (1fr, 2fr),
    [??], [直到 typst #sys.version 无法实现此功能。],
  )
) <unavailable>
#figure(
  table(
    columns: (1fr, 2fr),
    [!!], [可以复杂实现，需要更简单的方法。],
  )
) <tricky>
// #figure(
//   table(
//     columns: (1fr, 2fr),
//     [?!], [不知道如何实现。],
//   )
// ) <noidea>

= Rule One
任何数学内容，哪怕只有一个字符，都需要使用数学环境。
因此，对于「$x$ 的值为 $7$」，输入 `$x$ 的值为 $7$`。

= 模板
您的文档至少应包含以下内容。

#grid(
  "",
  ```
  -- document body here --
  ```
)

= 常见结构
#align(center, table(
  columns: 4,
  align: (right, left, right, left),
  column-gutter: (1em, 1.5em, 1em),
  [$x^2$], [`x^2`],
  [$sqrt(2)$, $root(n, 3)$], [`sqrt(2)`, `root(n, 3)`],
  [$x_(i, j)$], [`x_(i, j)`],
  [$2 / 3$, $2 \/ 3$], [`2 / 3`, `2 \/ 3` or `2 slash 3`], // Maybe use `slash`?
))

= 书法字母
使用 `$cal(A)$`.

$ cal(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) $

手写字母 @unavailable.

= 希腊字母
#align(center, table(
  columns: 4,
  align: (right, left, right, left),
  column-gutter: (1em, 1.5em, 1em),
  [$alpha$], [`alpha`], [$xi$, $Xi$], [`xi`, `Xi`],
  [$beta$], [`beta`], [$omicron$], [`omicron`],
  [$gamma$, $Gamma$], [`gamma`, `Gamma`], [$pi$, $Pi$], [`pi`, `Pi`],
  [$delta$, $Delta$], [`delta`, `Delta`], [$pi.alt$], [`pi.alt`],
  [$epsilon.alt$], [`epsilon.alt`], [$rho$], [`rho`],
  [$epsilon$], [`epsilon`], [$rho.alt$], [`rho.alt`],
  [$zeta$], [`zeta`], [$sigma$, $Sigma$], [`sigma`, `Sigma`],
  [$eta$], [`eta`], [$sigma.alt$], [`sigma.alt`],
  [$theta$, $Theta$], [`theta`, `Theta`], [$tau$], [`tau`],
  [$theta.alt$], [`theta.alt`], [$upsilon$, $Upsilon$], [`upsilon`, `Upsilon`],
  [$iota$], [`iota`], [$phi.alt$, $Phi$], [`phi.alt`, `Phi`],
  [$kappa$], [`kappa`], [$phi$], [`phi`],
  [$lambda$, $Lambda$], [`lambda`, `Lambda`], [$chi$], [`chi`],
  [$mu$], [`mu`], [$psi$, $Psi$], [`psi`, `Psi`],
  [$nu$], [`nu`], [$omega$, $Omega$], [`omega`, `Omega`],
))

= 集合与逻辑
#align(center, table(
  columns: 6,
  align: (right, left, right, left, right, left),
  column-gutter: (1em, 1.5em, 1em, 1.5em, 1em),
  [$union$], [`union`], [$RR$], [`RR`, `bb(R)`], [$forall$], [`forall`],
  [$sect$], [`sect`], [$bb(Z)$], [`ZZ`, `bb(Z)`], [$exists$], [`exists`],
  [$subset$], [`subset`], [$bb(Q)$], [`QQ`, `bb(Q)`], [$not$], [`not`],
  [$subset.eq$], [`subset.eq`], [$bb(N)$], [`NN`, `bb(N)`], [$or$], [`or`],
  [$supset$], [`supset`], [$bb(C)$], [`CC`, `bb(C)`], [$and$], [`and`],
  [$supset.eq$], [`supset.eq`], [$diameter$], [`diameter`], [$tack.r$], [`tack.r`],
  [$in$], [`in`], [$nothing$], [`nothing`], [$models$], [`models`],
  [$in.not$], [`in.not`], [$alef$], [`alef`], [$without$], [`without`],
))

想要否定一个运算符，如 $subset.not$，要写成 `subset.not`。
集合的补集 $A^(sans(c))$ 写法是 `A^(sans(c))`（$A^(complement)$ 的写法是 `A^(complement)`，而 $overline(A)$ 的写法是 `overline(A)`）。

// https://www.ctan.org/tex-archive/fonts/newcomputermodern
//
// README
//
//     Version 3.93
//
//       Provides access to Russian and Greek guillemotleft and guillemotright
//     using the character variant tables cv3 and cv4 respectively.
//
//       The Math fonts provide the character \varnothing, an alternative to \emptyset,
//     through Character Variant cv01. The fontsetup package provides the option
//     'varnothing' to easily switch to the alternative character.

// https://mirrors.sustech.edu.cn/CTAN/fonts/newcomputermodern/doc/newcm-doc.pdf
// The NewComputerModern FontFamily §13.3
// The Math fonts provide the character \varnothing (⌀, U+2300), as an alternative to \emptyset (a slashed zero), through Character Variant cv01.
// The fontsetup package provides the option ‘varnothing’ to easily switch to the alternative character.

/ 备注: 在使用 `diameter` 代表 `\varnothing` 可能会导致一些困惑。然而，#LaTeX 也使用 $diameter$（`\u{2300}`）而不是 $\u{2205}$（`\u{2205}`），详见#link("https://mirrors.sustech.edu.cn/CTAN/fonts/newcomputermodern/doc/newcm-doc.pdf")[newcm $section$13.3]。
  另一种解决方案是使用 `text(font: "Fira Sans", nothing)`，但是得到的字形 $text(font: "Fira Sans", nothing)$ 与广泛使用的字形略有不同。
  最终，选择始终是#strong[您的决定]。

= 装饰符号
#align(center, table(
  columns: 6,
  align: (right, left, right, left, right, left),
  column-gutter: (1em, 1.5em, 1em, 1.5em, 1em),
  [$f'$], [`f'`, `f prime`], [$dot(a)$], [`dot(a)`], [$tilde(a)$], [`tilde(a)`],
  [$f prime.double$], [`f prime.double`], [$diaer(a)$], [`diaer(a)`], [$macron(a)$], [`macron(a)`],
  [$Sigma^*$], [`Sigma^*`], [$hat(a)$], [`hat(a)`], [$arrow(a)$], [`arrow(a)`],
))

如果修饰的字母是 $i$ 或 $j$，那么某些修饰需要使用 `dotless.i` 和 `dotless.j`，例如 $arrow(dotless.i)$，可以使用 `arrow(dotless.i)`。
一些作者在表示向量时使用粗体：`bold(x)`。

输入 `overline(x + y)` 会生成 $overline(x + y)$，而 `hat(x + y)` 会给出 $hat(x + y)$。
可以在表达式中添加注释，例如在这里（还有`overbrace(..)`）。

#align(center, table(
  columns: 2,
  column-gutter: 1em,
  [$ underbrace(x + y, |A|) $],
  [
    ```
    underbrace(x + y, |A|)
    ```
  ],
))

= 点号
在列表中使用低点号表示为 ${0, 1, 2, ...}$，输入为 `{0, 1, 2, ...}`。
在求和或乘积中使用居中点号表示为 $1 + dots.h.c + 100$，输入为 `1 + dots.h.c + 100`。
您还可以使用垂直点号 `dots.v`，对角线点号 `dots.down` 和反对角线点号 `dots.up`。

= 函数名称
直接输入！

#align(center, table(
  columns: 6,
  align: (right, left, right, left, right, left),
  column-gutter: (1em, 1.5em, 1em, 1.5em, 1em),
  [$sin$], [`sin`], [$sinh$], [`sinh`], [$arcsin$], [`arcsin`],
  [$cos$], [`cos`], [$cosh$], [`cosh`], [$arccos$], [`arccos`],
  [$tan$], [`tan`], [$tanh$], [`tanh`], [$arctan$], [`arctan`],
  [$sec$], [`sec`], [$coth$], [`coth`], [$min$], [`min`],
  [$csc$], [`csc`], [$det$], [`det`], [$max$], [`max`],
  [$cot$], [`cot`], [$dim$], [`dim`], [$inf$], [`inf`],
  [$exp$], [`exp`], [$ker$], [`ker`], [$sup$], [`sup`],
  [$log$], [`log`], [$deg$], [`deg`], [$liminf$], [`liminf`],
  [$ln$], [`ln`], [$arg$], [`arg`], [$limsup$], [`limsup`],
  [$lg$], [`lg`], [$gcd$], [`gcd`], [$lim$], [`lim`],
))

#let cosec = math.op("cosec")

如果您想要使用的函数名不存在，您可以使用 `math.op` 来定义。例如，定义 $cosec$ 函数：

 ```
 #let cosec = math.op("cosec")
 $ cosec x = 1/(sin x) $
 ```

 $ cosec x = 1/(sin x) $

= 其他符号
#align(center, table(
  columns: 6,
  align: (right, left, right, left, right, left),
  column-gutter: (0.5em, 1em, 0.5em, 1em, 0.5em),
  [$<$], [`<`, `lt`], [$angle$], [`angle`], [$dot$], [`dot`],
  [$<=$], [`<=`, `lt.eq`], [$angle.arc$], [`angle.arc`], [$plus.minus$], [`plus.minus`],
  [$>$], [`>`, `gt`], [$ell$], [`ell`], [$minus.plus$], [`minus.plus`],
  [$>=$], [`>=`, `gt.eq`], [$parallel$], [`parallel`], [$times$], [`times`],
  [$!=$], [`!=`, `eq.not`], [$45 degree$], [`45 degree`], [$div$], [`div`],
  [$<<$], [`<<`, `lt.double`], [$tilde.equiv$], [`tilde.equiv`], [$*$], [`*`, `ast`],
  [$>>$], [`>>`, `gt.double`], [$tilde.nequiv$], [`tilde.nequiv`], [$divides$], [`divides`],
  [$approx$], [`approx`], [$tilde$], [`tilde`], [$divides.not$], [`divides.not`],
  [$\u{224D}$], [`\u{224D}` @tricky], [$tilde.eq$], [`tilde.eq`], [$n!$], [`n!`],
  [$equiv$], [`equiv`], [$tilde.not$], [`tilde.not`], [$diff$], [`diff`],
  [$prec$], [`prec`], [$plus.circle$], [`plus.circle`], [$nabla$], [`nabla`],
  [$prec.eq$], [`prec.eq`], [$minus.circle$], [`minus.cirle`], [$planck.reduce$], [`planck.reduce`],
  [$succ$], [`succ`], [$dot.circle$], [`dot.circle`], [$compose$], [`compose`],
  [$succ.eq$], [`succ.eq`], [$times.circle$], [`times.circle`], [$star$], [`star`],
  [$prop$], [`prop`], [$\u{2298}$], [`\u{2298}` @tricky], [$sqrt("")$], [`sqrt("")`],
  [$\u{2250}$], [`\u{2250}` @tricky], [$harpoon.tr$], [`harpoon.tr`], [$checkmark$], [`checkmark`],
))

使用 `a divides b` 表示整除，$a divides b$，使用 `a divides.not b` 表示不能整除，$a divides.not b$。
使用 `|` 来表示集合构建符号，${a in S | a "is odd"}$ 可以表示为 `{a in S | a "is odd"}`。

= 箭头
#align(center, table(
  columns: 4,
  align: (right, left, right, left),
  column-gutter: (1em, 1.5em, 1em),
  [$->$], [`->`, `arrow.r`], [$|->$], [`|->`, `arrow.r.bar`],
  [$arrow.r.not$], [`arrow.r.not`], [$arrow.r.long.bar$], [`arrow.r.long.bar`],
  [$-->$], [`-->`, `arrow.r.long`], [$<-$], [`<-`, `arrow.l`],
  [$=>$], [`=>`, `arrow.r.double`], [$<->$], [`<->`, `arrow.l.r`],
  [$arrow.r.double.not$], [`arrow.r.double.not`], [$arrow.b$], [`arrow.b`],
  [$==>$], [`==>`, `arrow.r.double.long`], [$arrow.t$], [`arrow.t`],
  [$arrow.squiggly$], [`arrow.squiggly`], [$arrow.t.b$], [`arrow.t.b`],
))

第一列中的右箭头有相应的左箭头，例如 `arrow.l.not`，还有一些其他匹配的向下箭头等。

= 可变大小的运算符
求和符号 $sum_(j = 0)^3 j^2$ `sum_(j = 0)^3 j^2` 和积分符号 $integral_(x = 0)^3 x^2 dif x$ `integral_(x = 0)^3 x^2 dif x` 在行间模式会展开。

$ sum_(j = 0)^3 j^2 wide integral_(x = 0)^3 x^2 dif x $

下面这些同理。

#align(center, table(
  columns: 4,
  align: (right, left, right, left),
  column-gutter: (1em, 1.5em, 1em),
  row-gutter: 0.5em,
  [$integral$], [`integral`], [$integral.double$], [`integral.double`],
  [$integral.triple$], [`integral.triple`], [$integral.cont$], [`integral.cont`],
  [$union.big$], [`union.big`], [$sect.big$], [`sect.big`],
))

= 括号
#align(center, table(
  columns: 6,
  align: (right, left, right, left, right, left),
  column-gutter: (1em, 1.5em, 1em, 1.5em, 1em),
  row-gutter: 0.5em,
  [$()$], [`()`], [$angle.l angle.r$], [`angle.l angle.r`], [$abs("")$], [`abs("")`],
  [$[]$], [`[]`], [$floor("")$], [`floor("")`], [$norm("")$], [`norm("")`],
  [${}$], [`{}`], [$ceil("")$], [`ceil("")`],
))

使用 `lr` 函数来固定大小。

#align(center, table(
  columns: 2,
  column-gutter: 1em,
  [$ lr([sum_(k = 0)^n e^(k^2)], size: #50%) $],
  [
    ```
    lr([sum_(k = 0)^n e^(k^2)], size: #50%)
    ```
  ],
))

为使它们与括号中的公式一起增长，也可以使用 `lr` 函数。

#align(center, table(
  columns: 2,
  column-gutter: 1em,
  [$ lr(angle.l i, 2^(2^i) angle.r) $],
  [
    ```
    lr(angle.l i, 2^(2^i) angle.r)
    ```
  ],
))

如果直接输入为代码点，则括号默认会按比例缩放，而如果以符号表示法输入，则括号不会自动缩放。

#align(center, table(
  columns: 2,
  align: (right + horizon, left + horizon),
  column-gutter: 1em,
  [$ (1 / n^(alpha)) $],
  [
    ```
    (1 / n^(alpha))
    ```
  ],
  [$ paren.l 1 / n^(alpha) paren.r $],
  [
    ```
    paren.l 1 / n^(alpha) paren.r
    ```
  ],
))

`lr` 函数还允许对不匹配的定界符和单侧括号进行缩放。

#align(center, table(
  columns: 2,
  column-gutter: 1em,
  [$ lr(frac(dif f, dif x) |)_(x_0) $],
  [
    ```
    lr(frac(dif f, dif x) |)_(x_0)
    ```
  ],
))

= 数组、矩阵
使用 `mat` 函数可以创建一个矩阵。可以将一个数组传递给它。

#align(center, table(
  columns: 2,
  column-gutter: 1em,
  [$ mat(a, b; c, d) $],
  [
    ```
    $ mat(a, b; c, d) $
    ```
  ],
))

在 Typst 中，#link("https://typst.app/docs/reference/typst/array")[array] 是一组数值，而在 #LaTeX 中，array 是没有括号的矩阵，相当于在 Typst 中使用 `$mat(delim: #none, ..)$`。

对于行列式，可以使用 `|A|`，文本运算符 $det$ `det` 或者 `mat(delim: "|", ..)`。

使用 `cases` 函数可以轻松定义分段函数。

#align(center, table(
  columns: 2,
  column-gutter: 1em,
  [
    $ f_n = cases(
      a &"if" n = 0,
      r dot f_(n - 1) &"else"
    ) $
  ],
  [
    ```
    $ f_n = cases(
      a &"if" n = 0,
      r dot f_(n - 1) &"else"
    ) $
    ```
  ]
))

= 数学中的间距
将 $sqrt(2) x$ 改进为带有细小间距的 $sqrt(2) thin x$，要写成 `sqrt(2) thin x`。
稍宽一些的间距是 `medium` 和 `thick`（它们的比例是 $3 : 4 : 5$）。
更大的间距是 `quad` 和 `wide`，效果分别是 $-> quad <-$ 和 $-> wide <-$，在行间公式的不同部分之间非常有用。
使用 `h` 函数可以获取任意间距。
例如，使用 `#h(-0.1667em)` 可以得到 #LaTeX 中的 `\!`。

= 行间公式
将行间公式以块级形式使用 `$ ... $`，其中数学内容和 `$` 之间至少有一个空格分隔。

#align(center, table(
  columns: 2,
  column-gutter: 1em,
  [$ S = k dot lg W $],
  [
    ```
    $ S = k dot lg W $
    ```
  ],
))

你可以写成多行。

#align(center, table(
  columns: 2,
  column-gutter: 1em,
  [
    $ sin(x) = x - x^3 / 3! \
      + x^5 / 5! - dots.h.c $
  ],
  [
    ```
    $ sin(x) = x - x^3 / 3! \
        + x^5 / 5! - dots.h.c $
    ```
  ],
))

用 `&` 来对齐公式

#align(center, table(
  columns: 2,
  column-gutter: 1em,
  [
    $ nabla dot bold(D) &= rho \
      nabla dot bold(B) &= 0 $
  ],
  ```
  $ nabla dot bold(D) &= rho \
    nabla dot bold(B) &= 0 $
  ```,
))

（对齐的左侧或右侧可以为空）。
通过 `#set math.equation(numbering: ..)` 给公式加编号。

= 微积分例子
最后三个是行间公式形式。

#align(center, table(
  columns: 2,
  column-gutter: 1em,
  [$ f: RR -> RR $],
  [
    ```
    f: RR -> RR
    ```
  ],
  [$ "9.8" "m/s"^2 $],
  [`"9.8" "m/s"^2` @tricky],
  [$ lim_(h->0) (f(x+h)-f(x))/h $],
  [
    ```
    lim_(h -> 0) (f(x + h) - f(x)) / h
    ```
  ],
  [$ integral x^2 dif x = x^3 \/ 3 + C $],
  [
    ```
    integral x^2 dif x = x^3 \/ 3 + C
    ```
  ],
  [$ nabla = bold(i) dif / (dif x) + bold(j) dif / (dif y) + bold(k) dif / (dif z) $],
  [
    ```
    nabla = bold(i) dif / (dif x) + bold(j) dif / (dif y) + bold(k) dif / (dif z)
    ```
  ],
))

= 离散数学例子
对于模运算，可以使用 `equiv` 来输入 $equiv$，用 `mod` 来输入文本运算符 $mod$。

对于组合，可以使用 `binom(n, k)` 中的二项式符号 $binom(n, k)$。在行间模式下会自动调整大小。

对于排列，可以使用 `n^(underline(r))` 来输入 $n^(underline(r))$ 符号（有些作者用 $P(n, r)$ 或 $""_n P_r$ 来表示，可以使用 `""_n P_r`）。

= 统计学例子
#align(center, table(
  columns: 2,
  column-gutter: 1em,
  [$ sigma^2 = sqrt(sum(x_i - mu)^2 \/ N) $],
  [
    ```
    sigma^2 = sqrt(sum(x_i - mu)^2 \/ N)
    ```
  ],
  [$ E(X) = mu_X = sum(x_i - P(x_i)) $],
  [
    ```
    E(X) = mu_X = sum(x_i - P(x_i))
    ```
  ],
  [$ 1 / sqrt(2 sigma^2 pi) e^(- (x - mu)^2 / (2 sigma^2)) $],
  [
    ```
    1 / sqrt(2 sigma^2 pi) e^(- (x - mu)^2 / (2 sigma^2))
    ```
  ]
))

= 更多
参见 Typst 文档：#link("https://typst.app/docs").

#v(1fr)

#block(
  inset: 4pt,
  stroke: (top: headcolor),
  text(headcolor)[johanvx (https://github.com/johanvx) #h(1fr) #date]
)

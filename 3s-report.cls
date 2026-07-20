\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{3s-report}[2026/04/02 Scalable Software Systems Report]

\LoadClass[twocolumn]{article}

\RequirePackage[
    letterpaper,
    left=1in,
    right=1in,
    top=1in,
    bottom=1.5in,
]{geometry}

\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{csquotes}
\RequirePackage{siunitx}
\RequirePackage{libertine}
\RequirePackage{newtxmath}
\RequirePackage[colorlinks=true,allcolors=Rhodamine]{hyperref}
\RequirePackage[all]{nowidow}
\RequirePackage{titlesec}
\RequirePackage{kantlipsum}
\RequirePackage{layouts}
\RequirePackage{graphicx}

\newcommand{\@project}{}
\newcommand{\@course}{}
\newcommand{\@semester}{}
\newcommand{\@summary}{}

\newcommand{\project}[1]{\gdef\@project{#1}}
\newcommand{\course}[1]{\gdef\@course{#1}}
\newcommand{\semester}[1]{\gdef\@semester{#1}}
\newcommand{\summary}[1]{\gdef\@summary{#1}}

\setlength{\columnsep}{16pt}

\newcommand{\measurept}[1]{\the#1}
\newcommand{\measurecm}[1]{\printinunitsof{cm}\prntlen{#1}}
\newcommand{\measurein}[1]{\printinunitsof{in}\prntlen{#1}}

\RequirePackage{array}
\RequirePackage{booktabs}
\RequirePackage{tabularx}
\RequirePackage{cuted}
\RequirePackage{hyperref}

\newcolumntype{Y}{>{\centering\arraybackslash}X}

\setlength{\stripsep}{4pt}

\newcommand{\authorlist}{}
\newcommand{\addauthor}[4]{%
    \g@addto@macro\authorlist{\href{mailto:#2}{#1} & #3 & #4 \\}
}
%\newcommand{\makeauthortable}{
%    \begin{strip}
%        %\centering\begin{tabularx}{0.7\linewidth}{ X l c l }
%        \centering\begin{tabular}{ l c l }
%            \toprule
%            \textbf{Name} & \textbf{Student ID} & \textbf{Chapters} \\
%            \midrule
%            \authorlist
%            \bottomrule
%        %\end{tabularx}
%        \end{tabular}
%        \vspace{8pt}
%    \end{strip}
%}

\renewcommand{\maketitle}{
    \twocolumn[
        \begin{center}
            { \Large \bfseries \textsf{\@project} \par }
            \vspace*{4pt}
            { \@course~—~\@semester \par }

            \vspace{8pt}
            \centering\begin{tabular}{ l c l }
                \toprule
                \textbf{Name} & \textbf{Student ID} & \textbf{Chapters} \\
                \midrule
                \authorlist
                \bottomrule
            \end{tabular}

            \vspace{8pt}
            \begin{tabularx}{0.75\linewidth}{X}
                \textbf{Summary} \@summary\\
            \end{tabularx}\par
        \end{center}
    ]
}

\newcommand{\makesummary}{
    %\begin{strip}
    \twocolumn[
        \centering\begin{tabularx}{0.7\linewidth}{X}
            \@summary\\
        \end{tabularx}
    ]
    %\end{strip}
}

\titleformat{\section}
    {\bfseries}
    {\thesection}
    {1em}
    {}

\titlespacing*{\section}
    {0pt}
    {\baselineskip}
    {0.5\baselineskip}

\titleformat{\subsection}
    {\bfseries}
    {\thesubsection}
    {1em}
    {}

\titlespacing*{\subsection}
    {0pt}
    {\baselineskip}
    {0.5\baselineskip}

\titleformat{\subsubsection}
    {\bfseries}
    {\thesubsubsection}
    {1em}
    {}

\titlespacing*{\subsubsection}
    {0pt}
    {\baselineskip}
    {0.5\baselineskip}

\setlength{\parskip}{0pt}
%\setlength{\parindent}{0pt}

\RequirePackage[noabbrev]{cleveref}
\crefformat{section}{\S#2#1#3} % see manual of cleveref, section 8.2.1
\crefformat{subsection}{\S#2#1#3}
\crefformat{subsubsection}{\S#2#1#3}
\crefrangeformat{section}{\S#3#1#4 to~\S#5#2#6}
\crefrangeformat{subsection}{\S#3#1#4 to~\S#5#2#6}
\crefrangeformat{subsubsection}{\S#3#1#4 to~\S#5#2#6}

\RequirePackage[
    backend=biber,
    style=numeric,
    sorting=none,
]{biblatex}
\addbibresource{references.bib}
\urlstyle{same}

%\setcounter{biburlnumpenalty}{9000}
\Urlmuskip=0mu plus 0mu

\DeclareFieldFormat{doi}{%
    \printtext{\textsc{Doi}}\addcolon\space
    \ifhyperref
        {\href{https://doi.org/#1}{\nolinkurl{#1}}}
        {\nolinkurl{#1}}}

\DeclareFieldFormat{url}{%
    \printtext{\textsc{Url}}\addcolon\space
    \ifhyperref
        {\href{#1}{\nolinkurl{#1}}}
        {\nolinkurl{#1}}}

\DeclareFieldFormat{eprint:arxiv}{%
    arXiv\addcolon\space
    \ifhyperref
        {\href{https://arxiv.org/abs/#1}{\nolinkurl{#1}}}
        {\nolinkurl{#1}}%
    \iffieldundef{eprintclass}
        {}
    {\addspace\mkbibbrackets{\thefield{eprintclass}}}}

\RequirePackage[outputdir=aux]{minted}
\definecolor{mintbg}{rgb}{0.95,0.95,0.95}
\setminted{bgcolor=mintbg}

\RequirePackage[scaled=0.8]{FiraMono}
\RequirePackage[T1]{fontenc}

\RequirePackage{caption}
\captionsetup[listing]{skip=0pt}

\frenchspacing

\RequirePackage[normalem]{ulem}

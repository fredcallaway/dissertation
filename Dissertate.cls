% -------------------------------------------------------------------
%  @LaTeX-class-file{
%     filename        = "Dissertate.cls",
%     version         = "2.0",
%     date            = "25 March 2014",
%     codetable       = "ISO/ASCII",
%     keywords        = "LaTeX, Dissertate",
%     supported       = "Send email to suchow@post.harvard.edu.",
%     docstring       = "Class for a dissertation."
% --------------------------------------------------------------------

% \usepackage{algorithm}
% \usepackage{algpseudocode}
\usepackage{minted}
\usepackage{sidecap}
\sidecaptionvpos{figure}{c}
\usepackage{dsfont}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Dissertate}[2014/03/25 v2.0 Dissertate Class]
\LoadClass[12pt, oneside, letterpaper]{book}
\synctex=1
%
% Options
%
\RequirePackage{etoolbox}

% Line spacing: dsingle/ddouble
%   Whether to use single- or doublespacing.
\newtoggle{DissertateSingleSpace}
\togglefalse{DissertateSingleSpace}
\DeclareOption{dsingle}{
    \toggletrue{DissertateSingleSpace}
    % \ClassWarning{Dissertate}{Single-spaced mode on.}
}
\DeclareOption{ddouble}{\togglefalse{DissertateSingleSpace}}

\ProcessOptions\relax

% Line Spacing
%   Define two line spacings: one for the body, and one that is more compressed.
\iftoggle{DissertateSingleSpace}{
    \newcommand{\dnormalspacing}{1.2}
    \newcommand{\dcompressedspacing}{1.0}
}{
    \newcommand{\dnormalspacing}{2.0}
    \newcommand{\dcompressedspacing}{1.2}
}

% Block quote with compressed spacing
\let\oldquote\quote
\let\endoldquote\endquote
\renewenvironment{quote}
    {\begin{spacing}{\dcompressedspacing}\oldquote}
    {\endoldquote\end{spacing}}

% Itemize with compressed spacing
\let\olditemize\itemize
\let\endolditemize\enditemize
\renewenvironment{itemize}
    {\begin{spacing}{\dcompressedspacing}\olditemize}
    {\endolditemize\end{spacing}}

% Enumerate with compressed spacing
\let\oldenumerate\enumerate
\let\endoldenumerate\endenumerate
\renewenvironment{enumerate}
    {\begin{spacing}{\dcompressedspacing}\oldenumerate}
    {\endoldenumerate\end{spacing}}

% Text layout.
% \RequirePackage[letterpaper]{geometry}
\usepackage[letterpaper]{geometry}
\geometry{
    top=1in,
    bottom=1in,
    left=1in,
    right=1in,
    % headheight=3ex,
    % headsep=3ex
}
% \RequirePackage[width=5.75in, letterpaper]{geometry}

\usepackage{ragged2e}
\RaggedRight
\RequirePackage{graphicx}
% \usepackage{fixltx2e}
\parindent 12pt
\RequirePackage{lettrine}
\RequirePackage{setspace}
\RequirePackage{verbatim}

% \usepackage{bbm}
% \usepackage{amsfonts}
\usepackage{amsmath}
% \usepackage{bm}
% \usepackage{amsmath,amsthm,amssymb,amsfonts,bm}
\usepackage{nicefrac}
\usepackage{booktabs}
\usepackage{bibentry}

% Fonts.
\RequirePackage{color}
\RequirePackage{xcolor}
\usepackage{hyperref}
\RequirePackage{url}
\RequirePackage{amssymb}
\RequirePackage{mathspec}

\setmathfont(Digits,Latin,Greek)[
    % Numbers=OldStyle,
    BoldFont       = * Bold,
    ItalicFont     = * Italic,
    BoldItalicFont = * Bold Italic,
]{Minion Pro}
\setmathrm{Minion Pro}

\AtBeginEnvironment{tabular}{\addfontfeature{RawFeature=+tnum}}
\widowpenalty=300
\clubpenalty=300
\setromanfont[
    Numbers=Proportional,
    Ligatures={Common, TeX},
    Scale=1.0
]{Minion Pro}
% \newfontfamily{\smallcaps}[Numbers=Proportional,RawFeature={+c2sc,+scmp}]{Minion Pro}

\setsansfont[Scale=MatchLowercase, BoldFont={Lato Bold}]{Lato Regular}
\setmonofont[Scale=0.8]{Source Code Pro}
\RequirePackage[labelfont={bf,sf,small,singlespacing},
                textfont={sf,small,singlespacing},
                justification={justified},
                singlelinecheck=false,
                margin=0pt,
                figurewithin=chapter,
                tablewithin=chapter]{caption}
% \renewcommand{\thefootnote}{\fnsymbol{footnote}}
\RequirePackage{microtype}


% Headings and headers.
\RequirePackage{fancyhdr}
\RequirePackage[tiny, md, sc]{titlesec}
\setlength{\headheight}{15pt}
\pagestyle{plain}
\RequirePackage{titling}

% Front matter.
\setcounter{tocdepth}{1}
\usepackage[titles]{tocloft}
\usepackage[titletoc]{appendix}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftchapfont}{\normalsize \scshape}
\renewcommand\listfigurename{Listing of figures}
\renewcommand\listtablename{Listing of tables}

% Endmatter
% \renewcommand{\setthesection}{\arabic{chapter}.A\arabic{section}}

% References.
\renewcommand\bibname{References}
\RequirePackage{natbib}
% \RequirePackage[super,comma,numbers]{natbib}
% \renewcommand{\bibnumfmt}[1]{[#1]}

% Chapters
\RequirePackage[palatino]{quotchap}
\renewcommand*{\chapterheadstartvskip}{\vspace*{-0.5\baselineskip}}
% \renewcommand*{\chapterheadendvskip}{\vspace{1.3\baselineskip}}
\renewcommand*{\chapterheadendvskip}{}

\newcommand{\Chapter}[2][]{%
    \chapter{#2}
    \begin{flushright}
    {\large\itshape #1}
    \vspace{1.4\baselineskip}
    \end{flushright}
}

% An environment for paragraph-style section.
\providecommand\newthought[1]{%
    \addvspace{1.0\baselineskip plus 0.5ex minus 0.2ex}%
    \noindent\textsc{#1}%
}

% Align reference numbers so that they do not cause an indent.
\newlength\mybibindent
\setlength\mybibindent{0pt}
\renewenvironment{thebibliography}[1]
    {\chapter*{\bibname}%
     \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
     \list{\@biblabel{\@arabic\c@enumiv}}
          {\settowidth\labelwidth{\@biblabel{999}}
           \leftmargin\labelwidth
            \advance\leftmargin\dimexpr\labelsep+\mybibindent\relax\itemindent-\mybibindent
           \@openbib@code
           \usecounter{enumiv}
           \let\p@enumiv\@empty
           \renewcommand\theenumiv{\@arabic\c@enumiv}}
     \sloppy
     \clubpenalty4000
     \@clubpenalty \clubpenalty
     \widowpenalty4000%
     \sfcode`\.\@m}
    {\def\@noitemerr
      {\@latex@warning{Empty `thebibliography' environment}}
     \endlist}

% Some definitions.
\def\advisor#1{\gdef\@advisor{#1}}
\def\coadvisorOne#1{\gdef\@coadvisorOne{#1}}
\def\coadvisorTwo#1{\gdef\@coadvisorTwo{#1}}
\def\committeeInternal#1{\gdef\@committeeInternal{#1}}
\def\committeeInternalOne#1{\gdef\@committeeInternalOne{#1}}
\def\committeeInternalTwo#1{\gdef\@committeeInternalTwo{#1}}
\def\committeeExternal#1{\gdef\@committeeExternal{#1}}
\def\degreeyear#1{\gdef\@degreeyear{#1}}
\def\degreemonth#1{\gdef\@degreemonth{#1}}
\def\degreeterm#1{\gdef\@degreeterm{#1}}
\def\degree#1{\gdef\@degree{#1}}
\def\department#1{\gdef\@department{#1}}
\def\field#1{\gdef\@field{#1}}
\def\university#1{\gdef\@university{#1}}
\def\universitycity#1{\gdef\@universitycity{#1}}
\def\universitystate#1{\gdef\@universitystate{#1}}
\def\programname#1{\gdef\@programname{#1}}
\def\pdOneName#1{\gdef\@pdOneName{#1}}
\def\pdOneSchool#1{\gdef\@pdOneSchool{#1}}
\def\pdOneYear#1{\gdef\@pdOneYear{#1}}
\def\pdTwoName#1{\gdef\@pdTwoName{#1}}
\def\pdTwoSchool#1{\gdef\@pdTwoSchool{#1}}
\def\pdTwoYear#1{\gdef\@pdTwoYear{#1}}
% School name and location
\university{Princeton University}
\universitycity{Princeton}
\universitystate{New Jersey}

% School color found from university's graphic identity site:
% http://www.princeton.edu/communications/services/image/graphic/color
\definecolor{SchoolColor}{rgb}{0.9608, 0.5020, 0.1451}
\definecolor{chaptergrey}{rgb}{0.9608, 0.5020, 0.1451}
\definecolor{graylink}{rgb}{0.6, 0.6, 0.6}

\hypersetup{
    colorlinks,
    citecolor=graylink,
    filecolor=black,
    linkcolor=SchoolColor,
    urlcolor=graylink,
}

% Formatting guidelines found in:
% http://www.princeton.edu/~mudd/thesis/MuddDissertationRequirements.pdf

\renewcommand{\maketitle}{
    \thispagestyle{empty}
    \vspace*{\fill}
    \vspace{75pt}
    \begin{center}
    \Huge \thetitle \normalsize \\
    \vspace{100pt}
    \textsc{\theauthor}\\
    \vspace{50pt}
    \sc
        a dissertation\\
      presented to the faculty\\
      of Princeton University\\
      in candidacy for the degree\\
    of \@degree\\

      \vspace{35pt}
      recommended for acceptance\\
      by the Department of\\
        \@department\\
        \vspace{25pt}
      Advisor: \@advisor \\
        \vspace{15pt}
      \@degreemonth\ \@degreeyear
    \rm
    % {\newline \vspace{50pt} \large This draft was compiled on \today\\}
    \end{center}
    \vspace*{\fill}
}

\newcommand{\copyrightpage}{
    \newpage
    \thispagestyle{empty}
    \vspace*{25pt}
    \begin{center}
    \scshape \noindent \small \copyright \  \small Copyright by \theauthor, \@degreeyear. All rights reserved.
    \end{center}
    \newpage
    \rm
}

\newcommand{\abstractpage}{
    \phantomsection
    \addcontentsline{toc}{chapter}{Abstract}
    \newpage
    % \pagenumbering{roman}
    \setcounter{page}{3}
    \pagestyle{fancy}
    \renewcommand{\headrulewidth}{0.0pt}
    \vspace*{35pt}
    \begin{center}
    \scshape Abstract \\ \rm
    \end{center}
    \input{frontmatter/abstract}
    \vspace*{\fill}
    \newpage \lhead{} \rhead{}
    \cfoot{\thepage}
}

\newcommand{\dedicationpage}{
    \newpage \thispagestyle{fancy} \vspace*{\fill}
    \scshape \noindent \input{frontmatter/dedication}
    \vspace*{\fill} \newpage \rm
}

\newcommand{\acknowledgments}{
    \chapter*{Acknowledgments}
    \noindent
    \input{frontmatter/thanks}
    \vspace*{\fill} \newpage
    % \setcounter{page}{1}
    % \pagenumbering{arabic}
}

% \renewcommand{\backmatter}{
%     \begin{appendices}
%         \include{chapters/appendixA}
%     \end{appendices}
%     \input{endmatter/personalize}
%     \clearpage
%     \bibliography{references}
%     \addcontentsline{toc}{chapter}{References}
%     \bibliographystyle{apalike2}
%     % \include{endmatter/colophon}
% }

% everything below makes each citation a single link (rather than author and year)
\usepackage{etoolbox}
\makeatletter

\pretocmd{\NAT@citex}{%
  \let\NAT@hyper@\NAT@hyper@citex
  \def\NAT@postnote{#2}%
  \setcounter{NAT@total@cites}{0}%
  \setcounter{NAT@count@cites}{0}%
  \forcsvlist{\stepcounter{NAT@total@cites}\@gobble}{#3}}{}{}
\newcounter{NAT@total@cites}
\newcounter{NAT@count@cites}
\def\NAT@postnote{}

% include postnote and \citet closing bracket in hyperlink
\def\NAT@hyper@citex#1{%
  \stepcounter{NAT@count@cites}%
  \hyper@natlinkstart{\@citeb\@extra@b@citeb}#1%
  \ifnumequal{\value{NAT@count@cites}}{\value{NAT@total@cites}}
    {\ifNAT@swa\else\if*\NAT@postnote*\else%
     \NAT@cmt\NAT@postnote\global\def\NAT@postnote{}\fi\fi}{}%
  \ifNAT@swa\else\if\relax\NAT@date\relax
  \else\NAT@@close\global\let\NAT@nm\@empty\fi\fi% avoid compact citations
  \hyper@natlinkend}
\renewcommand\hyper@natlinkbreak[2]{#1}

% avoid extraneous postnotes, closing brackets
\patchcmd{\NAT@citex}
  {\ifNAT@swa\else\if*#2*\else\NAT@cmt#2\fi
   \if\relax\NAT@date\relax\else\NAT@@close\fi\fi}{}{}{}
\patchcmd{\NAT@citex}
  {\if\relax\NAT@date\relax\NAT@def@citea\else\NAT@def@citea@close\fi}
  {\if\relax\NAT@date\relax\NAT@def@citea\else\NAT@def@citea@space\fi}{}{}

\makeatother
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
% \usepackage{minted}
% \usepackage{sidecap}
% \sidecaptionvpos{figure}{c}
% \usepackage{dsfont}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{memo}
% \LoadClass[12pt, oneside, letterpaper]{book}
\LoadClass[12pt,letterpaper]{article}
\synctex=1
%
% Options
%
\RequirePackage{etoolbox}

\newcommand{\dnormalspacing}{1.2}
\newcommand{\dcompressedspacing}{1.0}

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
                margin=0pt]{caption}
\RequirePackage{microtype}


% Headings and headers.
\RequirePackage{fancyhdr}
\RequirePackage[tiny, md, sc]{titlesec}
\setlength{\headheight}{15pt}
\pagestyle{plain}
% \RequirePackage{titling}


\setcounter{secnumdepth}{0}

% References.
% \renewcommand\bibname{References}
\RequirePackage{natbib}
% \RequirePackage[super,comma,numbers]{natbib}
% \renewcommand{\bibnumfmt}[1]{[#1]}



% An environment for paragraph-style section.
\providecommand\newthought[1]{%
    \addvspace{1.0\baselineskip plus 0.5ex minus 0.2ex}%
    \noindent\textsc{#1}%
}

% Align reference numbers so that they do not cause an indent.
% \newlength\mybibindent
% \setlength\mybibindent{0pt}
% \renewenvironment{thebibliography}[1]
%     {\chapter*{\bibname}%
%      \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
%      \list{\@biblabel{\@arabic\c@enumiv}}
%           {\settowidth\labelwidth{\@biblabel{999}}
%            \leftmargin\labelwidth
%             \advance\leftmargin\dimexpr\labelsep+\mybibindent\relax\itemindent-\mybibindent
%            \@openbib@code
%            \usecounter{enumiv}
%            \let\p@enumiv\@empty
%            \renewcommand\theenumiv{\@arabic\c@enumiv}}
%      \sloppy
%      \clubpenalty4000
%      \@clubpenalty \clubpenalty
%      \widowpenalty4000%
%      \sfcode`\.\@m}
%     {\def\@noitemerr
%       {\@latex@warning{Empty `thebibliography' environment}}
%      \endlist}


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

% everything below makes each citation a single link (rather than author and year)
% \usepackage{etoolbox}
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Drexel University Thesis LaTeX2e Class defintion.
% Patched by Christopher D. Cera 2003-03-10
% Patched by Mitchell Peabody in 2002
% Patched by David T. McWherter 2000-07-13
%     Written by Vincent A. Cicirello 1999-02-13 based on:
% 		University of Toronto Thesis LaTex2e Class definition.
% 		Written by Robert Bernecky 1997-07-10, based on
% 		the thesis.sty written at UofT by fpitt.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{drexelthesis}[2000/07/13 Drexel University Thesis class]

\RequirePackage{setspace}

% The following options are what you get if you do not specify ANY options.
%% E.g., \documentclass{drexelthesis}
%% Basically, it is your camera copy.

\ExecuteOptions{letterpaper,oneside,12pt,onecolumn,final,openany}

%% If you want a cheap-and-cheerful draft copy, try options such
%% \documentclass[draft,twoside,11pt]{drexelthesis} 

%% Set up handling of "draft" option. 

\usepackage{indentfirst}
\setlength{\textheight}{9in} % Height of the main body of the text


\DeclareOption{draft}{%
 \PassOptionsToPackage{all}{draftcopy}% 
 \PassOptionsToClass{draft}{report}% 
 \AtEndOfClass{%
   \RequirePackage{draftcopy}%
   % I wanted to print timestamp of each file, but I don't see
   % how to do that...
   \draftcopyName{DRAFT: \today}{60 } % text for overprinting if in "draft" mode
   }%
}

% Pass ALL options to report.cls.
\DeclareOption*{%
 \PassOptionsToClass{\CurrentOption}{report}
}

\ProcessOptions

\LoadClass{report} 
% Set up environments for thesis sections.

% clearemptydoublepage from page 92 of The LaTeX Companion 1993. 
\newcommand{\clearemptydoublepage}{\newpage{\pagestyle{empty}\cleardoublepage}}

\newcommand{\drexelborders}{
 %\setlength{\textheight}{8.0in} % Height of the main body of the text
 \setlength{\topmargin}{0.5in} % .0" margin on top of page
 \setlength{\headsep}{1.0in}  % space between header and top of body
 \addtolength{\headsep}{-\headheight} % See The LaTeX Companion, p 85
 \setlength{\footskip}{.5in}  % space between footer and bottom of body
 \setlength{\textwidth}{6.0in} % width of the body of the text
 \setlength{\oddsidemargin}{.5in} % 1.5" margin on the left for odd pages
 \setlength{\evensidemargin}{0in} % 1.0"  margin on the right for even pages
}

\newcommand{\drexelmainborders}{
 %\setlength{\textheight}{8.0in} % Height of the main body of the text
 \setlength{\topmargin}{0.5in} % .0" margin on top of page
 \setlength{\headsep}{0.5in}  % space between header and top of body
 \addtolength{\headsep}{-\headheight} % See The LaTeX Companion, p 85
 \setlength{\footskip}{.5in}  % space between footer and bottom of body
 \setlength{\textwidth}{6.0in} % width of the body of the text
 \setlength{\oddsidemargin}{0.3in} % 1.5" margin on the left for odd pages
 \setlength{\evensidemargin}{0in} % 1.0"  margin on the right for even pages
}

\renewenvironment{thebibliography}[1]
     {	\drexelmainborders
	\begin{center}
	  \section*{
	    \bibname
            \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}}
	\end{center}
	\list{\@biblabel{\@arabic\c@enumiv}}%
             {\settowidth\labelwidth{\@biblabel{#1}}%
               \leftmargin\labelwidth
               \advance\leftmargin\labelsep
               \@openbib@code
               \usecounter{enumiv}%
               \let\p@enumiv\@empty
               \renewcommand\theenumiv{\@arabic\c@enumiv}}%
	     \sloppy
	     \clubpenalty4000
	     \@clubpenalty \clubpenalty
	     \widowpenalty4000%
	     \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
       \endlist}

\newcommand\mycontentsname{\hfill \normalsize{Table of Contents} \hfill}


\newcommand\mytableofcontents{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \drexelborders
    \section*{\mycontentsname
      \@mkboth{\MakeUppercase\mycontentsname}
	      {\MakeUppercase\mycontentsname}}

    \@starttoc{toc}
    \if@restonecol\twocolumn\fi
    }

\newcommand\mylistfigurename{\hfill \normalsize{List of Figures} \hfill}

\newcommand\mylistoffigures{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \drexelborders
    \section*{\mylistfigurename
      \@mkboth{\MakeUppercase\mylistfigurename}%
              {\MakeUppercase\mylistfigurename}}%

    \@starttoc{lof}%
    \if@restonecol\twocolumn\fi
    }

\newcommand\mylisttablename{\hfill \normalsize{List of Tables} \hfill}

\newcommand\mylistoftables{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \drexelborders
  
%   \begin{center}
    \section*{\mylisttablename
      \@mkboth{\MakeUppercase\mylisttablename}{\MakeUppercase\mylisttablename}}%
%    \end{center}
    \@starttoc{lot}%
    \if@restonecol\twocolumn\fi
    }


\renewenvironment{abstract}%
{
\drexelborders
 \clearemptydoublepage 
 \begin{spacing}{1.0}
 \begin{center}
   \section*{\normalsize{Abstract}}
   \vspace*{-.2in}
  {\@title}\\
  {\@author}\\
  {\@advisor}
 \end{center}
 \end{spacing}
 \begingroup
}{\newpage\endgroup}

\newenvironment{acknowledgements}%
{
 \drexelborders
 \clearemptydoublepage
 \begin{center}
   \section*{\normalsize{Acknowledgements}}
 \end{center}
 \begingroup
}{\newpage\endgroup}

\newenvironment{dedication}%
{
 \drexelborders
 \clearemptydoublepage 
 \begin{center}
  \section*{\normalsize{Dedications}}
 \end{center}
 \begingroup
}{\newpage\endgroup}

\newenvironment{preliminary}%
{\pagenumbering{roman}}%
{\pagenumbering{arabic}}

% Default values for title page.

%% To produce output with the desired line spacing, the argument of
%% \spacing should be multiplied by 5/6 = 0.8333, so that 1 1/2 spaced
%% corresponds to \spacing{1.5} and double spaced is \spacing{1.66}.
\def\normalspacing{1.66} % default line spacing
\linespread{1.66} % default line spacing

\newcommand{\department}[1]{\ifx\empty#1\else\gdef\@department{#1}\fi}
\newcommand{\degree}[1]{\ifx\empty#1\else\gdef\@degree{#1}\fi}
\renewcommand{\author}[1]{\ifx\empty#1\else\gdef\@author{#1}\fi}
\newcommand{\advisor}[1]{\ifx\empty#1\else\gdef\@advisor{#1}\fi}
\renewcommand{\title}[1]{\ifx\empty#1\else\gdef\@title{#1}\fi}
\newcommand{\gyear}[1]{\ifx\empty#1\else\gdef\@gyear{#1}\fi}


\global\def\@department{\mbox{}}
\global\def\@degree{\mbox{}}
\global\def\@author{\mbox{}}
\global\def\@advisor{\mbox{}}
\global\def\@title{\mbox{}}
\global\def\@gyear{\number\year} % Default year is current year

% redefine the plain pagestyle so that page numbers are in the upper right hand corner
% this is to deal with commands such as \tableofcontents that like to switch the
% pagestyle to plain
 
\renewcommand{\ps@plain}{%
           \renewcommand{\@mkboth}{\@gobbletwo}%
           \renewcommand{\@evenhead}{\reset@font\rmfamily\hfil\thepage}%
           \renewcommand{\@oddhead}{\reset@font\rmfamily\hfil\thepage}%
           \renewcommand{\@evenfoot}{}%
           \renewcommand{\@oddfoot}{}}

\renewcommand{\maketitle}
{\begin{titlepage}
   \setcounter{page}{1}
   \vspace*{1.5in}
   
   \begin{center}
      {\bf {\@title}}\\
	A Thesis \\
	Submitted to the Faculty \\
	of \\
	Drexel University \\
      by \\
      {\@author}\\
	in partial fulfillment of the \\
	requirements for the degree \\
	of \\
	Master of Science in Mechanical Engineering \\
	June 2018 \\
   \end{center}
   \end{titlepage}
   \setcounter{page}{2}
}%\maketitle


%% Footnotes are always single-spaced.
%%\let\@@footnotetext=\@footnotetext
%%\def\@footnotetext{\begin{spacing}{1}\@@footnotetext\end{spacing}}


%% Define the "thesis" page style.
\if@twoside % If two-sided printing.
\def\ps@thesis{\let\@mkboth\markboth
   \def\@oddfoot{}
   \let\@evenfoot\@oddfoot
   \def\@oddhead{\reset@font\rmfamily\hfil\thepage}
   \def\@evenhead{\reset@font\rmfamily\hfil\thepage}
      
   \def\chaptermark##1{\markright{\ifnum \c@secnumdepth >\m@ne
      Chapter\ \thechapter. \ \fi ##1}}}
\else % If one-sided printing.
\def\ps@thesis{\let\@mkboth\markboth
   \def\@oddfoot{}
   \def\@oddhead{\reset@font\rmfamily\hfil\thepage}
      
   \def\chaptermark##1{\markright{\ifnum \c@secnumdepth >\m@ne
      Chapter\ \thechapter. \ \fi ##1}}}
\fi

\pagestyle{thesis}

% Set up page layout.
\drexelmainborders

% Marginal notes
\setlength{\marginparwidth}{.75in} % width of marginal notes
\setlength{\marginparsep}{.125in} % space between marginal notes and text

% Make each page fill up the entire page. comment this out if you
% prefer. 
%\flushbottom
\setcounter{tocdepth}{2} % Number the subsubsections 


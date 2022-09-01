% Intro Options
\ProvidesClass{resume-openfont}[2021/05/30 Abdullah's version]
\NeedsTeXFormat{LaTeX2e}
\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
    \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}

%--------------------------------------------------------------
% Package Imports
% \RequirePackage[english]{babel}
\usepackage{fontspec}
% page setup 
\RequirePackage{fancyhdr}
% Set boundaries
\RequirePackage[hmargin=1.1cm, vmargin=0.94cm]{geometry}
% remove ugly boxes around links
\usepackage[hidelinks]{hyperref}
% setup custom titles
\RequirePackage{titlesec}
% For skills table
\RequirePackage{enumitem}
% Using tables like the profile section
\RequirePackage{tabularx}
% Used for the link symbol
\defaultfontfeatures{
    Path = /usr/share/texlive/texmf-dist/tex/latex/fontawesome/ }
% \usepackage{fontawesome}
% \RequirePackage{fontawesome}
% Set up font 
\RequirePackage{lato-font}
\RequirePackage{raleway-font}
\usepackage{textcomp, gensymb}
%--------------------------------------------------------------
% Reformatting default sections
% section
\titlespacing{\section}{0pt}{0pt}{0pt}
\titleformat{\section}{%
\color{headings}% Using comments to allow us to split the command across multiple line
\scshape%
\customLatoLight%
\fontsize{14pt}{24pt}%first number is size, second number is space between lines
\selectfont%
\uppercase%
} {}{0em}{}

% subsection
\titlespacing{\subsection}{0pt}{\parskip}{-\parskip}
\titleformat{\subsection}{%
\color{subheadings}%
\customLatoBlack%
\fontsize{10pt}{10pt}%
\selectfont%
\bfseries%
\uppercase%
\normalfont% Normal font is used to reset the customization, so it doesn't bleed into anything else
} {}{0em}{}

% remove header footer stuff like page numbers 
\newcommand{\resetHeaderAndFooter}{%
\fancyhf{}%
\fancyfoot{}%
\renewcommand{\headrulewidth}{0pt}%
\renewcommand{\footrulewidth}{0pt}%
}
%--------------------------------------------------------------
% Formatting commands - commands to control spacing

% A shortcut to control spacing
\newcommand{\NoSpace}{\vspace*{-0.7pt}}

% Command to simulate new line, to fix spacing glitches
\newcommand{\fakeNewLine}{\newline \vspace{-\baselineskip}}

% Command to align table at the start of the resume
\newcommand{\alignProfileTable}{
    \raggedbottom
    \raggedright
    \setlength{\tabcolsep}{0in}
}

%--------------------------------------------------------------
% Subheadings command - create different types of heading
\newcommand{\runsubsection}[1]{%
\color{subheadings}%
\customLatoBlack%
\fontsize{10pt}{10pt}%
% \selectfont%
\bfseries%
\selectfont{#1}%
\normalfont}%

% Descriptors command
\newcommand{\descript}[1]{%
\color{subheadings}%
\raggedright%
\scshape%
\customRalewayMedium%
\fontsize{10pt}{10pt}%
\selectfont{#1}%
\normalfont}

% Location command
\newcommand{\location}[1]{%
% \color{headings}%
\raggedright%
\customRalewayMedium%
\fontsize{10pt}{10pt}%
\selectfont{#1}%
\normalfont}

% Minor command - like even smaller sub section
\newcommand{\minorSection}[1]{%
\color{subheadings}%
\raggedright%
\scshape%
\customRalewayMedium%
\fontsize{12pt}{10pt}%
\selectfont{#1}%
\normalfont}

% Project command
\newcommand{\Project}[2]{
\runsubsection{%
\href{#2}{\uppercase{#1} \,\faExternalLink}
}
    \hfill
}

% Underlined link command
\newcommand{\underlinedLink}[2]{%
\underline{\href{#1}{#2}}%
}

% Command for table 
\newcommand{\singleItem}[2]{\normalsize{\textbf{#1} #2}}
\newcommand{\doubleItem}[4]{\singleItem{#1}{#2} & \singleItem{#3}{#4}}

%--------------------------------------------------------------
% Section separators command
\newcommand{\sectionsep}[0]{\vspace{7pt}}

%--------------------------------------------------------------
% Bullet Lists with fewer gaps command
\newenvironment{bullets}{
    \begin{itemize}
    \vspace{-0.5ex}
    \itemsep0.5pt
    \parskip1.5pt
    \parsep1.5pt
    \justifying
    }{
        \end{itemize}
    }

% Command for skill table
\newenvironment{skillList}{%
\noindent%
\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}%
}{%
\end{tabular*}%
}

\usepackage{enumitem}
\newlist{skillsListIndent}{itemize}{1}
\setlist[skillsListIndent]{
  nosep,
  before={\let\makelabel=\labels},
  leftmargin=*,
  labelwidth=10em,
  label={\hspace{10em}},
}
\newcommand{\labels}[1]{ \textbf{#1}:\hfill}

\newlist{educationList}{itemize}{1}
\setlist[educationList]{
  nosep,
  before={\let\makelabel=\labels},
  leftmargin=*,
  labelwidth=7em,
  label={\hspace{7em}},
}
\newcommand{\researchHeading}[1]{
\runsubsection{%
{\uppercase{#1}
\customRalewayMedium
\fontsize{5pt}{10pt}%
}\\
}
}

%--------------------------------------------------------------
% Customize built-in commands
% Align Sections
\let\oldSection\section
\renewcommand{\section}[1]{\oldSection{#1}\raggedright}

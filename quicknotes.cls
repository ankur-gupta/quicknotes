%%
%% Written by Ankur Gupta, April 21, 2019
%% ankur@perfectlyrandom.org
%% Copyright (c) Ankur Gupta, 2019
%%
%% License: GPL v3. See LICENSE.
%%

%% Default Option Settings:
% 11pt, letterpaper
% not draft, not fleqn, not leqno

% See these links for reference:
% https://en.wikibooks.org/wiki/LaTeX/Document_Structure
% https://texblog.org/2013/02/13/latex-documentclass-options-illustrated/
% https://www.overleaf.com/learn/latex/Writing_your_own_class

% ---------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{quicknotes}[QuickNotes]  %% Date format: YYYY/MM/DD. This has to be maintained.
\typeout{Document Class 'quicknotes' v0.1 <21 Apr 2019>}
% ---------------------------------------

% ---------------------------------------
% Don't hardcode "article" everywhere.
\newcommand{\baseclass}{article}
% ---------------------------------------

% ---------------------------------------
%% Define possible choices for every option for your new class.
%% These are not the default options yet. We will define default options later in this file.
% Font size: we allow 10pt, 11pt, or 12pt
\DeclareOption{10pt}{
    \PassOptionsToClass{\CurrentOption}{\baseclass}
}
\DeclareOption{11pt}{
    \PassOptionsToClass{\CurrentOption}{\baseclass}
}
\DeclareOption{12pt}{
    \PassOptionsToClass{\CurrentOption}{\baseclass}
}

% Oneside or twoside: twoside has different margins on odd and even numbered pages
% Option twoside is not a valid choice. If you do allow twoside, then change settings for fancyhdr
% below to add E (even) and O(odd).
\DeclareOption{oneside}{
    \PassOptionsToClass{\CurrentOption}{\baseclass}
}

% Number of columns
\DeclareOption{twocolumn}{
    \PassOptionsToClass{\CurrentOption}{\baseclass}
}

% Paper size: two choices of paper
\DeclareOption{a4paper}{
    \PassOptionsToClass{\CurrentOption}{\baseclass}
}
\DeclareOption{letterpaper}{
    \PassOptionsToClass{\CurrentOption}{\baseclass}
}

% Draft or not?
\DeclareOption{draft}{
    \PassOptionsToClass{\CurrentOption}{\baseclass}
}

% Formulas left aligned (fleqn) or centered
\DeclareOption{fleqn}{
    \PassOptionsToClass{\CurrentOption}{\baseclass}
}

% Numbering of formulas on left (leqno) instead of right
\DeclareOption{leqno}{
    \PassOptionsToClass{\CurrentOption}{\baseclass}
}
% ---------------------------------------

% ---------------------------------------
%% Unknown option: every other option is not valid.
\DeclareOption*{
    \ClassWarning{myclass}{You have used an unknown option '\CurrentOption'}
}
% ---------------------------------------

% ---------------------------------------
%% Default Options
\ExecuteOptions{11pt}
\ExecuteOptions{oneside}
\ExecuteOptions{letterpaper}
% ---------------------------------------

% ---------------------------------------
%% Execute
% Process given options
\ProcessOptions\relax

% Load class : report
\LoadClass{\baseclass}
% ---------------------------------------


%%%%%%%%%%%%%% Here comes the style stuff %%%%%%%%%%%%%%%%%%
%-----------------------------------------------------------------------------
%% Colors
\RequirePackage[dvipsnames]{xcolor}
\definecolor{webgreen}{rgb}{0,.5,0}
\definecolor{webbrown}{rgb}{.6,0,0}
%-----------------------------------------------------------------------------

%-----------------------------------------------------------------------------
%% Set margins using geometry package
% At least 1in margins on all sides
\RequirePackage[pdftex,left=1.75in,right=1.25in,top=1.25in,bottom=1.25in]{geometry}
%-----------------------------------------------------------------------------

%-----------------------------------------------------------------------------
%% Page Number
% Set page numbers at the top right hand corner.
% Exactly one inch from the top and right paper edge.
% See https://www.overleaf.com/learn/latex/Headers_and_footers
\RequirePackage{fancyhdr}

\fancypagestyle{plain}{
    \fancyhf{} % clear all header and footer fields
    \fancyheadoffset[R]{0.25in} % = right(passed to geometry) - 1in
    \fancyhead[R]{\thepage} % Put page number on leftside(even) and rightside(odd)
    \renewcommand{\headrulewidth}{0pt} % I don't want a line
}
\pagestyle{plain} % I need either empty or plain. So I can put this here as default.
%-----------------------------------------------------------------------------

%-----------------------------------------------------------------------------
%% Load palatino fonts for text and pazo for math (with true small caps and old style figures)
\RequirePackage[sc,osf]{mathpazo}
\linespread{1.05}
\usepackage[T1]{fontenc} % provides many things (eg: good searching text on PDF)
%-----------------------------------------------------------------------------

%-----------------------------------------------------------------------------
%% Repeatedly used commands: \spacedallcaps, \spacedlowsmallcaps
% Soul: provides letterspacing and other things
\RequirePackage{soul}

\sodef\allcapsspacing{\upshape}{0.15em}{0.65em}{0.6em} %define new spacing
\DeclareRobustCommand{\spacedallcaps}[1]{\MakeTextUppercase{\allcapsspacing{#1}}}

\sodef\lowsmallcapsspacing{\scshape}{0.075em}{0.5em}{0.6em} %define new spacing
\DeclareRobustCommand{\spacedlowsmallcaps}[1]{\MakeTextLowercase{\textsc{\lowsmallcapsspacing{#1}}}}%\protect
%-----------------------------------------------------------------------------

%% Last command in a .cls file
\endinput

% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/glmmLasso_MultLambdas.r
\name{glmmLasso_MultLambdas}
\alias{glmmLasso_MultLambdas}
\title{glmmLasso_MultLambdas}
\usage{
glmmLasso_MultLambdas(fix, rnd, data, family = stats::gaussian(link =
  "identity"), lambdas = NULL, nlambdas = 100,
  lambda.min.ratio = ifelse(nobs < nvars, 0.01, 1e-04), ...)
}
\arguments{
\item{fix}{A two-sided linear formula object describing the fixed-effects part of the model, with the response on the left of a ~ operator and the terms, separated by + operators, on the right. For categorical covariables use as.factor(.) in the formula. Note, that the corresponding dummies are treated as a group and are updated blockwise}

\item{rnd}{A two-sided linear formula object describing the random-effects part of the model, with the grouping factor on the left of a ~ operator and the random terms, separated by + operators, on the right; aternatively, the random effects design matrix can be given directly (with suitable column names). If set to NULL, no random effects are included.}

\item{data}{The data frame containing the variables named in formula.}

\item{family}{a GLM family, see glm and family. Also ordinal response models can be fitted: use family=acat() and family=cumulative() for the fitting of an adjacent category or cumulative model, respectively. If family is missing then a linear mixed model is fit; otherwise a generalized linear mixed model is fit.}

\item{lambdas}{The penalty parameter that controls the shrinkage of fixed terms and controls the variable selection. The optimal penalty parameter is a tuning parameter of the procedure that has to be determined, e.g. by use of information criteria or cross validation. Should inputted as a numeric vector from high to low. (See details for an example.)}

\item{nlambdas}{the number of lambdas values, default value is 100.}

\item{lambda.min.ratio}{Smallest value for lambda, as a fraction of lambda.max, the (data derived) entry value (i.e. the smallest value for which all coefficients are zero). The default depends on the sample size nobs relative to the number of variables nvars. If nobs > nvars, the default is 0.0001, close to zero. If nobs < nvars, the default is 0.01.}

\item{\dots}{can receive parameters accepted by glmmLasso}
}
\value{
Returns a glmmLasso_MultLambdas object, which is list glmmLasso models for each lambda value.
}
\description{
Variable selection using glmmLasso for multiple lambdas values
}
\details{
Build multiple models given a sequence of lambda values
}
\examples{

library(glmmLasso)
data("soccer")

mod1 <- glmmLasso_MultLambdas(fix = points ~ transfer.spendings + 
ball.possession + tackles , rnd = list(team =~ 1), 
data = soccer, family = poisson(link = log)) 


 
}
\author{
Pirapong Jitngamplang, Jared Lander
}

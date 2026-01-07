# MASA03 — Probability Exam: README

## Session A (2–3h): Foundations + Bayes

- Read: Probability space, σ-algebra basics (continuity of P), CDF properties.
- Do: 3 Bayes/Law-of-Total-Probability word problems.
- Memorize: Bayes, LTP, inclusion–exclusion, indicator tricks.

## Session B (2–3h): Distributions + Transforms

- Read: Bernoulli, Geom, Bin, Poisson, Exp, Normal (+ “law of rare events”).
- Do: Convolution (sum of exponentials), U[0,1] + U[0,1] → triangular, product XY on a square.
- Memorize: LOTUS, min/max formulas, memoryless (Exp).

## Session C (2–3h): Vectors + Limits

- Read: Independence tests, covariance, linear maps: Var(AX)=A Var(X) Aᵀ.
- Do: Conditional density/expectation (f_{X|Y}, E[X|Y]), total variance.
- Learn: LLN (weak/strong), CLT use (normal approx.), modes of convergence.

---

## What the exam keeps asking (patterns)

- **Bayes/LTP word problems:** test reliability, production lines, “prepare vs not,” medical tests.
- **Empirical counts:** n·Fₙ(t) or n·Sₙ(t) are Binomial (mean/var quickly).
- **Transformations:** Sums (convolution), products/ratios via CDF/Jacobian; uniform-on-region puzzles.
- **Reliability:** Series/parallel systems with exponentials; survival functions multiply.
- **Mixed distributions:** Discrete+continuous with explicit base measure.
- **Covariance/linear algebra:** Build/check covariance matrices, propagate through linear maps.
- **Limit theorems:** LLN/CLT statements + quick approximations; convergence definitions & implications.

---

## Minimal formula pack (must know)

- **Inclusion–exclusion:** P(A∪B)=P(A)+P(B)−P(A∩B).
- **Total prob.:** P(B)=∑ P(B|Aᵢ)P(Aᵢ).  **Bayes:** P(Aⱼ|B)= P(B|Aⱼ)P(Aⱼ)/∑ P(B|Aᵢ)P(Aᵢ).
- **Indicators:** E[1_A]=P(A), Var= p(1−p).  **Empirical:** ∑1_{Xᵢ≤t} ~ Bin(n,F(t)).
- **Named dists (means/vars):**
  - Bernoulli(p): p, p(1−p) | Bin(n,p): np, np(1−p)
  - Geom(p) (on {1,2,…}): 1/p, (1−p)/p²
  - Poisson(λ): λ, λ (Bin→Poisson if n large, p small, λ=np)
  - Exp(θ): mean 1/θ, memoryless; min of iid Exp’s is Exp(sum rates)
  - Normal(μ,σ²): linear combos stay normal
- **Convolution (indep.):** f_{X+Y}=f_X * f_Y.  **Monotone transform:** f_Y(y)=f_X(g⁻¹(y))·|d/dy g⁻¹(y)|.
- **Min/Max (iid CDF F):** F_max(t)=F(t)^n; F_min(t)=1−(1−F(t))^n.
- **Reliability:** Series: P(T>t)=∏P(Tᵢ>t); Parallel: P(T>t)=1−∏(1−P(Tᵢ>t)).
- **Conditioning:** f_{X|Y}(x|y)=f_{X,Y}(x,y)/f_Y(y); LOTUS: E[g(X)]=∫g f_X.
- **Total expectation/variance:** E[X]=E[E[X|Y]]; Var(X)=E[Var(X|Y)]+Var(E[X|Y]).
- **Linear maps:** Var(AX)=A Var(X) Aᵀ; Cov linearity by bilinearity.
- **LLN/CLT:** Ȳ_n → μ (WLLN in prob., SLLN a.s.); √n(Ȳ_n−μ) ⇒ N(0,σ²).

---

## Fast method recipes

1. **Bayes word problem:** Partition {Aᵢ} → LTP for P(B) → Bayes for P(Aⱼ|B).
2. **Empirical at fixed t:** Iᵢ=1{Xᵢ≤t} ⇒ ∑Iᵢ ~ Bin(n,F(t)) ⇒ mean/var instantly.
3. **Sum of exponentials:** distinct rates θ₁≠θ₂ ⇒ f(t)=θ₁θ₂/[θ₂−θ₁](e^{−θ₁t}−e^{−θ₂t}); equal → Gamma.
4. **Uniform square/circle:** f_{X,Y}=const on region; get marginals, test independence; for X+Y use convolution; for XY use CDF area or log-transform.
5. **Conditional density:** f_{X|Y}=f_{X,Y}/f_Y → E[X|Y=y]=∫x f_{X|Y}(x|y)dx → total variance formula.
6. **Series/parallel with Exp:** use survivals; plug P(Tᵢ>t)=e^{−λᵢt}.
7. **CLT approx:** Convert P(S_n>a) → P(Ȳ_n>a/n) → standardize with (Ȳ_n−μ)/(σ/√n).

---

## 8 micro-drills

- Bayes (2 problems), empirical Binomial (1), convolution of Exp (1),
- Uniform-sum & product (2), conditional density + E[X|Y] (1),
- Reliability series/parallel (1), CLT approximation (1).

---

## Exam tactics

- Translate prose → partition/events/indicators first.
- Write support & base measure before integrating/summing.
- For transforms: prefer CDF or symmetry if Jacobian is messy.
- Sanity checks: pdf≥0, integrates to 1; units/dimensions; edge cases (t=0, t→∞).

Good luck — focus on Bayes, transforms, conditioning/variance, Bin/Poisson/Exp/Normal, and LLN/CLT. That’s 80/20.

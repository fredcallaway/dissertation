CHAPTER 1:

* Pg 12-13 -- you use the terms "cognitive process" and "cognitive model" interchangeably. Are the two terms supposed to be synonyms, or do they mean something different? If they mean something different, I'd suggest defining them precisely.

* Pg 14. You write: "From a statistical perspective, optimality acts as an inductive bias. Any given behavioral phenomenon is consistent with countless cognitive models (Anderson, 1978), but only a small subset of those are optimal." This is a minor detail, but that's not quite true: we can always see *any* model as optimal under some definition of optimality. I suppose that you want to say is that only some models are optimal for a notion of optimality that is commonly adopted for humans.

* Pg 14. "If people are well-adapted to their environment, then all else being equal, the optimal models are more likely to resemble the truth than an arbitrary alternative model." This is also not necessarily true. If we imagine evolution/learning as gradient ascent on V(pi), we can reach a local maximum but not the global maximum, and there's no reason why the globally optimal model is more likely to resemble the truth. All we can say is that a locally optimal model is more likely to resemble truth than a non-locally-optimal model.

* Pg 14: "we might not know the exact state of the world" -- that seems to be already accounted for in Eq 1.4 by taking the expectation over states, right? i.e., that was an expectation over states the world could be in. I'm assuming that's an expectation over the agent's beliefs already, no? If not, where else could account for that stochasticity over states?

* In pg 18, beginning of 1.4.1, you state that Eq 1.5 is intractable, but the "cost-benefit" tradeoff (EVC) is something that we can work with. How is that the case? Aren't the issues with Eq 1.5, listed in pg 16, also present for the EVC approach?

* The whole portion on pg 14-20 (sections 1.3-1.4) is not very clear to me -- specifically, the issues and advantages of using metalevel rationality and EVC as an approximation to bounded optimality. Both BO and EVC seem equally reasonable. Why is BO correct and EVC not? How are they different, and how is EVC an approximation to BO?

* Pg 21. In Eq 1.12, I think you want to use V(pi_act) instead of V(pi)

* Pg 24. You cite Payne et al. but there's no link to the reference.

* In pg 26, Eq 1.17 would probably be cleaner if the last term was m_t (which appears in the definition of c_t, which in turn appears in the expression that you're computing expectation over), and not m_{t+1}. 



CHAPTER 2:

* Pg 29: "Finally, the reward function" --> Just a note that this definition assumes that rewards are deterministic. It does not allow for stochastic rewards, which would require the function image to be a distribution (as in the definition of a transition function). Is there any reason why you restricted your framework to this setting? It would be fairly straightforward to use random rewards and use E[R] instead of R (e.g., in Eq 2.1).

* Pg 30: There's an inconsistency between (2.2) and (2.3). In (2.3), R is a function of random variables, but in (2.4) it is not. I believe you want to specify S_t and A_t as random variables (and thus, uppercase) in both cases. 

* Pg 32: You state "the metalevel reward function captures the costs (e.g., time) and benefits (e.g., better decisions) of computation". Isn't the "better decisions" piece captured by external reward?

* Pg 37: "These mental can..." should probably have been "These mental actions can..."

* Pg 40 (section 2.5.3): "the Bayesian view not incompatible with the mechanical view" should probably have been "the Bayesian view is not incompatible with the mechanical view"

* Pg 40: "This leaves bayes-update" seems out-of-place. Typo?

* Pg 42: Eq (2.23) is strange, as it computes an expectation of a probability. I think what you want is a marginalization (summation) over w.

* Pg 54: It would be very helpful to have a summary section summarizing the most important ideas of this chapter (similarly to what you had in Chapter 1).



CHAPTER 3:

* Pg 61: "The initial mental state is thus defined (μ0 = 0, λ0 = 1, f0 = ⊘), where ⊘ is a null value.". Here the mean is assumed to be zero and variance 1, but two lines before those quantities are specified as variables (mu-bar and sigmasq-bar).

* A scientific comment: I wonder if a similar pattern of results can be expected in tasks that do not involve fixation (e.g. the decision between going to London or Paris for vacation). Is it possible that humans sample experiences from memory sequentially, respecting a similar set of rules that you derived, to guide the optimal selection of the next sample.



CHAPTER 4:

* Pg 87: "The remainder of this paper is organized as follows." Maybe change to "The remainder of this chapter is organized as follows."? (actually, it seems like you use "paper" instead of "chapter" in several parts of the chapter; not a big deal).

* Pg 92: "To build intuition, note that with a very weak prior (large σ20), μt reduces to zt/t, the average rate of recall progress". Looks like the math here is not quite right. I think you might be missing a square on t in the sigma_t-square expression.

* Pg 107: "The key idea underlying both this models and ours" --> "these models"

* Pg 108: there's a missing reference in line 13.



CHAPTER 5:

* Pg 131, Eq (5.4) -- shouldn't we define the expected value of a plan to be the summation of rewards (m^i's) and then truncating with the sum of "cumulative" future rewards at the frontier? Right now, the expression includes E[U(i)] at the frontier, which is only a one-step reward.

* Pg 143, end of 1st paragraph of Discussion: "behavior matched the environment-appropriate algorithm, cs the optimal model predicted" -> "as the optimal model predicted".



CONCLUSION:

* Pg 158: "preciesly" -> precisely
...Otherwise, lots of great ideas and a beautiful closing section on the usefulness of frameworks.
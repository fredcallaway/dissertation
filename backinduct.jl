function Q(m::MentalState, c::Computation)
    if c == TERM
        term_reward(m) # $R(m, \bot)$
    else
        # $\expectunder{V^*(m')}{m' \sim T(m,c)} - \cost(m, c)$
        sum(p * V(m′) for (p, m′) in transition(m, c)) - cost(m, c)
    end
end

@memoize function V(m::MentalState)
    # $\max_{c \in \C(m)} Q(m, c)$
    maximum(Q(m, c) for c in computations(m))
end
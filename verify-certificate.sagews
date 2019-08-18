︠bd5d1b4d-85ec-4192-b62d-138a0b2c998cs︠
P = load("counterexample-P.sobj")
A = load("counterexample-A.sobj") # the output of our SDP, with entries rounded to rational numbers
B = P.T * A * P
C = B.change_ring(QQ)

def LDLt(A):
    N = A.nrows()
    terms = [] # (d,l) pair of diagonal entry and vector
    for i in range(0,N):
        pivot = A[i,i]
        if pivot != 0:
            l = 1/pivot * vector(list(A.columns()[i]))
            terms.append((pivot,l))
            A = A - pivot * l.outer_product(l)
    return terms

terms = LDLt(C)

# "terms" is [(d1,l1),(d2,l2),...,(dn,ln)]
# LDL^T = P^T A P, so we need P^T applied to m, where m is our original monomial vector.

def create_monomials(n,d):
    varz = [var('x%s'%i) for i in range(1,n+1)]
    mons = []
    for exps in IntegerVectors(d,n):
        prod = varz[0] - varz[0] + 1
        for i,x in enumerate(varz):
            prod *= x^exps[i]
        mons.append(prod)
    return mons

m = create_monomials(3,8)
m_shuffled = P.T * vector(m)

ans = []
for tup in terms:
    d,l = tup[0],tup[1]
    term = d * (l*m_shuffled)^2
    term = term.expand()
    ans.append(term)

res = sum(ans)
show(res.simplify())
︡6fb41a5f-c1c3-45d4-be41-fc49a27434f1︡{"html":"<div align='center'>$\\displaystyle \\frac{17}{9450} \\, x_{1}^{16} + \\frac{1}{1050} \\, x_{1}^{14} x_{2}^{2} + \\frac{1}{9450} \\, x_{1}^{12} x_{2}^{4} + \\frac{1}{525} \\, x_{1}^{10} x_{2}^{6} + \\frac{2}{315} \\, x_{1}^{8} x_{2}^{8} + \\frac{1}{525} \\, x_{1}^{6} x_{2}^{10} + \\frac{1}{9450} \\, x_{1}^{4} x_{2}^{12} + \\frac{1}{1050} \\, x_{1}^{2} x_{2}^{14} + \\frac{17}{9450} \\, x_{2}^{16} + \\frac{1}{1050} \\, x_{1}^{14} x_{3}^{2} - \\frac{16}{4725} \\, x_{1}^{12} x_{2}^{2} x_{3}^{2} - \\frac{8}{1575} \\, x_{1}^{10} x_{2}^{4} x_{3}^{2} + \\frac{11}{9450} \\, x_{1}^{8} x_{2}^{6} x_{3}^{2} + \\frac{11}{9450} \\, x_{1}^{6} x_{2}^{8} x_{3}^{2} - \\frac{8}{1575} \\, x_{1}^{4} x_{2}^{10} x_{3}^{2} - \\frac{16}{4725} \\, x_{1}^{2} x_{2}^{12} x_{3}^{2} + \\frac{1}{1050} \\, x_{2}^{14} x_{3}^{2} + \\frac{1}{9450} \\, x_{1}^{12} x_{3}^{4} - \\frac{8}{1575} \\, x_{1}^{10} x_{2}^{2} x_{3}^{4} - \\frac{11}{4725} \\, x_{1}^{8} x_{2}^{4} x_{3}^{4} - \\frac{1}{1890} \\, x_{1}^{6} x_{2}^{6} x_{3}^{4} - \\frac{11}{4725} \\, x_{1}^{4} x_{2}^{8} x_{3}^{4} - \\frac{8}{1575} \\, x_{1}^{2} x_{2}^{10} x_{3}^{4} + \\frac{1}{9450} \\, x_{2}^{12} x_{3}^{4} + \\frac{1}{525} \\, x_{1}^{10} x_{3}^{6} + \\frac{11}{9450} \\, x_{1}^{8} x_{2}^{2} x_{3}^{6} - \\frac{1}{1890} \\, x_{1}^{6} x_{2}^{4} x_{3}^{6} - \\frac{1}{1890} \\, x_{1}^{4} x_{2}^{6} x_{3}^{6} + \\frac{11}{9450} \\, x_{1}^{2} x_{2}^{8} x_{3}^{6} + \\frac{1}{525} \\, x_{2}^{10} x_{3}^{6} + \\frac{2}{315} \\, x_{1}^{8} x_{3}^{8} + \\frac{11}{9450} \\, x_{1}^{6} x_{2}^{2} x_{3}^{8} - \\frac{11}{4725} \\, x_{1}^{4} x_{2}^{4} x_{3}^{8} + \\frac{11}{9450} \\, x_{1}^{2} x_{2}^{6} x_{3}^{8} + \\frac{2}{315} \\, x_{2}^{8} x_{3}^{8} + \\frac{1}{525} \\, x_{1}^{6} x_{3}^{10} - \\frac{8}{1575} \\, x_{1}^{4} x_{2}^{2} x_{3}^{10} - \\frac{8}{1575} \\, x_{1}^{2} x_{2}^{4} x_{3}^{10} + \\frac{1}{525} \\, x_{2}^{6} x_{3}^{10} + \\frac{1}{9450} \\, x_{1}^{4} x_{3}^{12} - \\frac{16}{4725} \\, x_{1}^{2} x_{2}^{2} x_{3}^{12} + \\frac{1}{9450} \\, x_{2}^{4} x_{3}^{12} + \\frac{1}{1050} \\, x_{1}^{2} x_{3}^{14} + \\frac{1}{1050} \\, x_{2}^{2} x_{3}^{14} + \\frac{17}{9450} \\, x_{3}^{16}$</div>"}︡{"done":true}
︠463330d9-78df-4dd0-aba3-3d14f7c2efc7s︠
def input_squares(p):
    # input is our polynomial p, like H_(2,1) - H_(1,1,1)
    # output will be inserting each variable squared, also making it start at x1, x2,... rather than x0,x1,...
    current_vars = p.args() # this is a tuple of variables x0, x1, x2,... etc.
    numvars = len(current_vars)
    new_vars = [var('x%i'%i) for i in range(1,numvars+1)]
    subz = {}
    for i,vr in enumerate(current_vars):
        subz[vr] = (new_vars[i])^2
    ans = p.subs(subz)
    return ans

def plugin_ones(p):
    # want to return the number/scalar that results from plugging in 1's to all variables
    current_vars = p.args() # this is a tuple of variables x0, x1, x2,... etc.
    numvars = len(current_vars)
    subz = {}
    for i,vr in enumerate(current_vars):
        subz[vr] = 1
    ans = p.subs(subz)
    return ans

def term_normalize(p):
    norm = plugin_ones(p)
    ans = p/norm
    return ans

def create_difference(la,mu,n=3):
    h = SymmetricFunctions(QQ).h()
    # we will return the difference h_la - h_mu
    hla = h(la).expand(n)
    hmu = h(mu).expand(n)
    hla = input_squares(hla)
    hmu = input_squares(hmu)
    hla = term_normalize(hla)
    hmu = term_normalize(hmu)
    ans = hla - hmu
    return ans

show(create_difference((4,4),(5,2,1)))
︡d54d9be1-63f7-4d82-9fe1-83b06a2b827c︡{"html":"<div align='center'>$\\displaystyle \\frac{17}{9450} \\, x_{1}^{16} + \\frac{1}{1050} \\, x_{1}^{14} x_{2}^{2} + \\frac{1}{9450} \\, x_{1}^{12} x_{2}^{4} + \\frac{1}{525} \\, x_{1}^{10} x_{2}^{6} + \\frac{2}{315} \\, x_{1}^{8} x_{2}^{8} + \\frac{1}{525} \\, x_{1}^{6} x_{2}^{10} + \\frac{1}{9450} \\, x_{1}^{4} x_{2}^{12} + \\frac{1}{1050} \\, x_{1}^{2} x_{2}^{14} + \\frac{17}{9450} \\, x_{2}^{16} + \\frac{1}{1050} \\, x_{1}^{14} x_{3}^{2} - \\frac{16}{4725} \\, x_{1}^{12} x_{2}^{2} x_{3}^{2} - \\frac{8}{1575} \\, x_{1}^{10} x_{2}^{4} x_{3}^{2} + \\frac{11}{9450} \\, x_{1}^{8} x_{2}^{6} x_{3}^{2} + \\frac{11}{9450} \\, x_{1}^{6} x_{2}^{8} x_{3}^{2} - \\frac{8}{1575} \\, x_{1}^{4} x_{2}^{10} x_{3}^{2} - \\frac{16}{4725} \\, x_{1}^{2} x_{2}^{12} x_{3}^{2} + \\frac{1}{1050} \\, x_{2}^{14} x_{3}^{2} + \\frac{1}{9450} \\, x_{1}^{12} x_{3}^{4} - \\frac{8}{1575} \\, x_{1}^{10} x_{2}^{2} x_{3}^{4} - \\frac{11}{4725} \\, x_{1}^{8} x_{2}^{4} x_{3}^{4} - \\frac{1}{1890} \\, x_{1}^{6} x_{2}^{6} x_{3}^{4} - \\frac{11}{4725} \\, x_{1}^{4} x_{2}^{8} x_{3}^{4} - \\frac{8}{1575} \\, x_{1}^{2} x_{2}^{10} x_{3}^{4} + \\frac{1}{9450} \\, x_{2}^{12} x_{3}^{4} + \\frac{1}{525} \\, x_{1}^{10} x_{3}^{6} + \\frac{11}{9450} \\, x_{1}^{8} x_{2}^{2} x_{3}^{6} - \\frac{1}{1890} \\, x_{1}^{6} x_{2}^{4} x_{3}^{6} - \\frac{1}{1890} \\, x_{1}^{4} x_{2}^{6} x_{3}^{6} + \\frac{11}{9450} \\, x_{1}^{2} x_{2}^{8} x_{3}^{6} + \\frac{1}{525} \\, x_{2}^{10} x_{3}^{6} + \\frac{2}{315} \\, x_{1}^{8} x_{3}^{8} + \\frac{11}{9450} \\, x_{1}^{6} x_{2}^{2} x_{3}^{8} - \\frac{11}{4725} \\, x_{1}^{4} x_{2}^{4} x_{3}^{8} + \\frac{11}{9450} \\, x_{1}^{2} x_{2}^{6} x_{3}^{8} + \\frac{2}{315} \\, x_{2}^{8} x_{3}^{8} + \\frac{1}{525} \\, x_{1}^{6} x_{3}^{10} - \\frac{8}{1575} \\, x_{1}^{4} x_{2}^{2} x_{3}^{10} - \\frac{8}{1575} \\, x_{1}^{2} x_{2}^{4} x_{3}^{10} + \\frac{1}{525} \\, x_{2}^{6} x_{3}^{10} + \\frac{1}{9450} \\, x_{1}^{4} x_{3}^{12} - \\frac{16}{4725} \\, x_{1}^{2} x_{2}^{2} x_{3}^{12} + \\frac{1}{9450} \\, x_{2}^{4} x_{3}^{12} + \\frac{1}{1050} \\, x_{1}^{2} x_{3}^{14} + \\frac{1}{1050} \\, x_{2}^{2} x_{3}^{14} + \\frac{17}{9450} \\, x_{3}^{16}$</div>"}︡{"done":true}
︠e94de575-9297-45f5-9603-6ba9da92bd42︠










revenue = [14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97,
           15433.50]
expenses = [12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37,
            3803.96]
months=["jan","fab","mar","apr","may","jun","jul","aug","sep","oct","nov","dec"]

profit = list([])

# profit of 12 months

def pro():
    for i in range(0, len(revenue)):
        profit.append(revenue[i] - expenses[i])
    print(profit)

def taxi():
    # calculation tax (profit*30%)

    tax = [round(i * 0.3, 2) for i in profit]
    print("\n",tax)
    pat(tax)

def pat(x):
    # calculating profit after tax
    profit_after_tax = list([])

    for i in range(0, len(profit)):
        profit_after_tax.append(profit[i] - x[i])
    print("\n",profit_after_tax)
    mat(profit_after_tax)
    mmean(profit_after_tax)
    gm(profit_after_tax)


def mat(x):
    # profit margin after tax
    profit_margin = list([])


    for i in range(0, len(profit)):
        profit_margin.append(x[i] / revenue[i])

    profit_margin = [round((i * 100), 2) for i in profit_margin]

    print("\n",profit_margin)

def mmean(x):
    # profit after tax mean
    mean_pat = sum(x) / len(x)
    print("\n",mean_pat)
    return mean_pat


def gm(x):
    good_months = list([])
    for i in range(0, len(profit)):
        good_months.append(x[i] > mmean(x))

    print("\n",good_months)
def badm():
    bad_months = list([])
    for i in range(0, len(profit)):
        bad_months.append(profit_after_tax[i] < mean_pat)
    print("\n",bad_months)
def bestm():
    best_month = list([])
    for i in range(0, len(profit)):
        best_month.append(profit_after_tax[i] == max(profit_after_tax))
    print("\n",best_month)
def wm():
    worst_month = list([])
    for i in range(0, len(profit)):
        worst_month.append(profit_after_tax[i] == min(profit_after_tax))

    print("\n",worst_month)
pro()
taxi()


























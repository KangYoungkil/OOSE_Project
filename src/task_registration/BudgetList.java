package task_registration;

import java.util.ArrayList;

public class BudgetList {
	private ArrayList<Budget> budgetList;
	private volatile static BudgetList uniqueInstance = null;

	public ArrayList<Budget> getBudgetList() {
		return budgetList;
	}
	private BudgetList()
	{
		budgetList = new ArrayList<Budget>();
	}
	public static BudgetList getInstance() {
		if (uniqueInstance == null) {
			synchronized (BudgetList.class) {
				if (uniqueInstance == null)
					uniqueInstance = new BudgetList();
			}
		}
		return uniqueInstance;
	}
	public void add(Budget b)
	{
		budgetList.add(b);
	}
	public Budget getI(int i)
	{
		if(budgetList.size()>i && i >=0 )
			return budgetList.get(i);
		else return null;
	}
	public ArrayList<Budget> getList()
	{
		return budgetList;
	}
}

package task_caculate;

import java.util.ArrayList;
public class ClawbackList {

	private ArrayList<Clawback> clawbackList;
	private volatile static ClawbackList uniqueInstance = null;

	public ArrayList<Clawback> getClawList() {
		return clawbackList;
	}
	private ClawbackList()
	{
		clawbackList = new ArrayList<Clawback>();
	}
	public static ClawbackList getInstance() {
		if (uniqueInstance == null) {
			synchronized (ClawbackList.class) {
				if (uniqueInstance == null)
					uniqueInstance = new ClawbackList();
			}
		}
		return uniqueInstance;
	}
	public void add(Clawback b)
	{
		clawbackList.add(b);
	}
	public Clawback getI(int i)
	{
		if(clawbackList.size()>i && i >=0 )
			return clawbackList.get(i);
		else return null;
	}

	public ArrayList<Clawback> getList()
	{
		return clawbackList;
	}
}

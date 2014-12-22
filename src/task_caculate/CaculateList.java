package task_caculate;

import java.util.ArrayList;

public class CaculateList {

	private ArrayList<Caculate> caculateList;
	private volatile static CaculateList uniqueInstance = null;

	public ArrayList<Caculate> getCaculateList() {
		return caculateList;
	}
	private CaculateList()
	{
		caculateList = new ArrayList<Caculate>();
	}
	public static CaculateList getInstance() {
		if (uniqueInstance == null) {
			synchronized (CaculateList.class) {
				if (uniqueInstance == null)
					uniqueInstance = new CaculateList();
			}
		}
		return uniqueInstance;
	}
	public void add(Caculate b)
	{
		caculateList.add(b);
	}
	public Caculate getI(int i)
	{
		if(caculateList.size()>i && i >=0 )
			return caculateList.get(i);
		else return null;
	}
	public ArrayList<Caculate> getList()
	{
		return caculateList;
	}
}

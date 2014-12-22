package task_caculate;

import java.util.ArrayList;

public class EvidenceList {

	private ArrayList<Evidence> evidenceList;
	private volatile static EvidenceList uniqueInstance = null;

	public ArrayList<Evidence> getEvidenceList() {
		return evidenceList;
	}
	private EvidenceList()
	{
		evidenceList = new ArrayList<Evidence>();
	}
	public static EvidenceList getInstance() {
		if (uniqueInstance == null) {
			synchronized (EvidenceList.class) {
				if (uniqueInstance == null)
					uniqueInstance = new EvidenceList();
			}
		}
		return uniqueInstance;
	}
	public void add(Evidence e)
	{
		evidenceList.add(e);
	}
	public Evidence getI(int i)
	{
		if(evidenceList.size()>i && i >=0 )
			return evidenceList.get(i);
		else return null;
	}

	public ArrayList<Evidence> getList()
	{
		return evidenceList;
	}
}

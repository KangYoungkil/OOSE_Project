package task_caculate;

import java.util.ArrayList;

import task_notice.Notice;
import task_notice.NoticeActive;
import task_registration.Budget;
import task_registration.BudgetList;

public class BusinessCaculationControl {
	public Caculate selectCaculate(int projectNumber) {
		CaculateList caculateListEntity = CaculateList.getInstance();
		ArrayList<Caculate> caculateList = caculateListEntity.getCaculateList();

		for (Caculate c : caculateList) {
			if (c.getProjectNumber() == projectNumber) {
				return c;
			}
		}
		return null;
	}

	public Budget selectBudget(int projectNumber) {
		BudgetList budgetListEntity = BudgetList.getInstance();
		ArrayList<Budget> budgetList = budgetListEntity.getBudgetList();

		for (Budget b : budgetList) {
			if (b.getProjectNumber() == projectNumber) {
				return b;
			}
		}
		return null;
	}

	public Clawback selectClawback(int projectNumber) {
		ClawbackList clawbackListEntity = ClawbackList.getInstance();
		ArrayList<Clawback> clawbackList = clawbackListEntity.getClawList();

		for (Clawback c : clawbackList) {
			if (c.getProjectNumber() == projectNumber) {
				return c;
			}
		}
		return null;
	}

	public Evidence selectEvidence(int projectNumber) {
		EvidenceList evidenceListEntity = EvidenceList.getInstance();
		ArrayList<Evidence> evidenceList = evidenceListEntity.getEvidenceList();

		for (Evidence e : evidenceList) {
			if (e.getProjectNumber() == projectNumber) {
				return e;
			}
		}
		return null;
	}

	public int selectProjectVerificationAmount(int projectNumber) {
		int budgetAmount = selectBudget(projectNumber).getAmount();
		int caculateAmount = selectCaculate(projectNumber).getAmount();
		return budgetAmount - caculateAmount;
	}

	public void selectProjectAppropriationAmount(int projectNumber) {

	}

	public void addBudget(Budget b) {
		BudgetList bl = BudgetList.getInstance();
		for (Budget bg : bl.getInstance().getList())
			if (b.getProjectNumber() == bg.getProjectNumber())
				return;
		bl.add(b);
	}

	public void addEvidence(Evidence e) {
		EvidenceList el = EvidenceList.getInstance();

		for (Evidence ev : el.getInstance().getList())
			if (e.getProjectNumber() == ev.getProjectNumber())
				return;
		el.add(e);
	}

	public void addCaculate(Caculate c) {
		CaculateList cl = CaculateList.getInstance();
		for (Caculate ca : cl.getInstance().getList())
			if (ca.getProjectNumber() == c.getProjectNumber())
				return;
		cl.add(c);
	}
	public void addClawbakc(Clawback c)
	{
		ClawbackList cl = ClawbackList.getInstance();
		for (Clawback ca : cl.getInstance().getList())
			if (ca.getProjectNumber() == c.getProjectNumber())
				return;
		cl.add(c);
	}
	public void addNotice(Notice n)
	{
		NoticeActive na = NoticeActive.getInstance();
		na.add(n);
	}
}

package task_registration;

public class Budget {
	private int amount;
	private int projectNumber;
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getProjectNumber() {
		return projectNumber;
	}
	public void setProjectNumber(int projectNumber) {
		this.projectNumber = projectNumber;
	}
	public Budget(int projectNumber, int amount)
	{
		this.projectNumber = projectNumber;
		this.amount = amount;
	}
}

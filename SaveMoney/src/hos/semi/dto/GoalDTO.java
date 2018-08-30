package hos.semi.dto;

import java.sql.Date;

public class GoalDTO {
	private int goalIdx;
	private String goalSubject;
	private int goalLimitM;
	private Date goalStart;
	private Date goalEnd;
	private int goalTerm;
	
	public int getGoalIdx() {
		return goalIdx;
	}
	public String getGoalSubject() {
		return goalSubject;
	}
	public int getGoalLimitM() {
		return goalLimitM;
	}
	public Date getGoalStart() {
		return goalStart;
	}
	public Date getGoalEnd() {
		return goalEnd;
	}
	public int getGoalTerm() {
		return goalTerm;
	}
	public void setGoalIdx(int goalIdx) {
		this.goalIdx = goalIdx;
	}
	public void setGoalSubject(String goalSubject) {
		this.goalSubject = goalSubject;
	}
	public void setGoalLimitM(int goalLimitM) {
		this.goalLimitM = goalLimitM;
	}
	public void setGoalStart(Date goalStart) {
		this.goalStart = goalStart;
	}
	public void setGoalEnd(Date goalEnd) {
		this.goalEnd = goalEnd;
	}
	public void setGoalTerm(int goalTerm) {
		this.goalTerm = goalTerm;
	}
	
}

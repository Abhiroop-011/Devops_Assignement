# Git & GitHub Assignment: Commit Flags and Cherry-Picking

**Author:** Abhiroop Sistu  
**Student ID:** 24bcs10287 

## Task 1: `git commit -a -m` vs `git commit -m`

**Concept Summary:** 
Using `git commit -m` alone will only commit files that have been explicitly staged. The `-a` flag acts as an automatic sweep, telling Git to stage any modified or deleted tracked files before committing them. However, it will never stage brand-new, untracked files.

### 1: The Failing Commit
*Attempting to commit modifications and new files without staging them first.*

![Screenshot 1](Screenshot%202026-09-04%20161959.png)
![Screenshot 2](Screenshot%202026-09-04%20162014.png)

### 2: The Successful `-a` Commit
*Using the `-a` flag to successfully auto-stage the tracked file modification, while observing that the untracked file is still correctly ignored.*

![Screenshot 1](Screenshot%202026-09-04%20162054.png)

---

## Task 2: Git Cherry-Pick

**Concept Summary:**
Cherry-picking allows us to select a specific commit from one branch and apply its exact changes to another branch. This is highly useful for backporting bug fixes or pulling out specific features without merging an entire branch's history.

### 3: Setup for Cherry-Pick
*Creating the `main` branch timeline, branching out to `feature`, creating the target hotfix commit, and identifying its specific hash using the graph log.*

![Cherry-Pick Setup - Screenshot 1](Screenshot%202026-09-04%20201945.png)
![Cherry-Pick Setup - Screenshot 2](Screenshot%202026-09-04%20202014.png)
![Cherry-Pick Setup - Screenshot 3](Screenshot%202026-09-04%20202026.png)

### 4: Execute the Cherry-Pick
*Switching back to `main` and executing the cherry-pick to pull over only the hotfix. The final verification shows the file existing on main with a newly generated commit hash.*

![Execute Cherry-Pick - Screenshot 1](Screenshot%202026-09-04%20202422.png)
![Execute Cherry-Pick - Screenshot 2](Screenshot%202026-09-04%20202429.png)
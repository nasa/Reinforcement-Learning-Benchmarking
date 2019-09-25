# Reinforcement Learning Benchmarks

This project provides scripts for running several OpenAI Baselines algorithms on all MuJoCo or Roboschool gym environments in order to compare algorithm performance.

## Prerequisites

The following Python packages are required:

[gym](https://github.com/openai/gym)

[roboschool](https://github.com/openai/roboschool) (Only required if you want to run Roboschool environments)

[baselines](https://github.com/openai/baselines) (Note: baselines must be installed from source.  A pip install will give you an outdated version)

matplotlib

argparse

os

The MuJoCo software, [mjpro150](https://www.roboti.us/index.html) is required to run the MuJoCo environments.  The MuJoCo submodule for gym is also required, which can be installed via

```bash
pip install gym[mujoco]
```

## How to run

Run the bash script by typing

```bash
./runExperiments.sh
```

The bash script accepts the following positional command line arguments:

1: Subdirectory to save training data in.  Default is data.

2: mujoco or roboschool - Choose which environment set to run.  Default is roboschool.

3: Number of timesteps to run each algorithm.  Defualt is 1000000.

4: Number of random seeds to run for each algorithm.  Default is 3.

For example, to save data to a subdirectory called "test", run the MuJoCo environments for 10000 timesteps with each algorithm, and run 5 different seeds for each algorithm, you would type

```bash
./runExperiments.sh test mujoco 10000 5
```

## Viewing results

Plots of all learning curves are saved as pdf files in a subfolder inside the data folder called plots.  These plots show the episode reward vs. number of timesteps, and the smoothing function from the baselines plot utility is applied.  The shaded regions represent the variations across all seeds, and the solid line represents the mean across all seeds. 

---

__**Notices**__:

_Copyright **2019** United States Government as represented by the Administrator of the National Aeronautics and Space Administration.  No copyright is claimed in the United States under Title 17, U.S. Code. All Other Rights Reserved._

__**Disclaimers**__

_No Warranty_: THE SUBJECT SOFTWARE IS PROVIDED "AS IS" WITHOUT ANY WARRANTY OF ANY KIND, EITHER EXPRESSED, IMPLIED, OR STATUTORY, INCLUDING, BUT NOT LIMITED TO, ANY WARRANTY THAT THE SUBJECT SOFTWARE WILL CONFORM TO SPECIFICATIONS, ANY IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, OR FREEDOM FROM INFRINGEMENT, ANY WARRANTY THAT THE SUBJECT SOFTWARE WILL BE ERROR FREE, OR ANY WARRANTY THAT DOCUMENTATION, IF PROVIDED, WILL CONFORM TO THE SUBJECT SOFTWARE. THIS AGREEMENT DOES NOT, IN ANY MANNER, CONSTITUTE AN ENDORSEMENT BY GOVERNMENT AGENCY OR ANY PRIOR RECIPIENT OF ANY RESULTS, RESULTING DESIGNS, HARDWARE, SOFTWARE PRODUCTS OR ANY OTHER APPLICATIONS RESULTING FROM USE OF THE SUBJECT SOFTWARE.  FURTHER, GOVERNMENT AGENCY DISCLAIMS ALL WARRANTIES AND LIABILITIES REGARDING THIRD-PARTY SOFTWARE, IF PRESENT IN THE ORIGINAL SOFTWARE, AND DISTRIBUTES IT "AS IS." 
 
_Waiver and Indemnity_:  RECIPIENT AGREES TO WAIVE ANY AND ALL CLAIMS AGAINST THE UNITED STATES GOVERNMENT, ITS CONTRACTORS AND SUBCONTRACTORS, AS WELL AS ANY PRIOR RECIPIENT.  IF RECIPIENT'S USE OF THE SUBJECT SOFTWARE RESULTS IN ANY LIABILITIES, DEMANDS, DAMAGES, EXPENSES OR LOSSES ARISING FROM SUCH USE, INCLUDING ANY DAMAGES FROM PRODUCTS BASED ON, OR RESULTING FROM, RECIPIENT'S USE OF THE SUBJECT SOFTWARE, RECIPIENT SHALL INDEMNIFY AND HOLD HARMLESS THE UNITED STATES GOVERNMENT, ITS CONTRACTORS AND SUBCONTRACTORS, AS WELL AS ANY PRIOR RECIPIENT, TO THE EXTENT PERMITTED BY LAW.  RECIPIENT'S SOLE REMEDY FOR ANY SUCH MATTER SHALL BE THE IMMEDIATE, UNILATERAL TERMINATION OF THIS AGREEMENT.

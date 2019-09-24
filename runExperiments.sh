#!/bin/bash

# Bash script to run all experiments
# Command line arguments:
# 1: Subdirectory to save training data in.  Default is data.
# 2: mujoco or roboschool - Choose which environment set to run.  Default is roboschool.
# 3: Number of timesteps to run each algorithm.  Defualt is 1000000.
# 4: Number of random seeds to run for each algorithm.  Default is 3.

# Notices:
# Copyright 2019 United States Government as represented by the Administrator of the National Aeronautics and Space Administration.  No copyright is claimed in the United States under Title 17, U.S. Code. All Other Rights Reserved.

# Disclaimers
# No Warranty: THE SUBJECT SOFTWARE IS PROVIDED "AS IS" WITHOUT ANY WARRANTY OF ANY KIND, EITHER EXPRESSED, IMPLIED, OR STATUTORY, INCLUDING, BUT NOT LIMITED TO, ANY WARRANTY THAT THE SUBJECT SOFTWARE WILL CONFORM TO SPECIFICATIONS, ANY IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, OR FREEDOM FROM INFRINGEMENT, ANY WARRANTY THAT THE SUBJECT SOFTWARE WILL BE ERROR FREE, OR ANY WARRANTY THAT DOCUMENTATION, IF PROVIDED, WILL CONFORM TO THE SUBJECT SOFTWARE. THIS AGREEMENT DOES NOT, IN ANY MANNER, CONSTITUTE AN ENDORSEMENT BY GOVERNMENT AGENCY OR ANY PRIOR RECIPIENT OF ANY RESULTS, RESULTING DESIGNS, HARDWARE, SOFTWARE PRODUCTS OR ANY OTHER APPLICATIONS RESULTING FROM USE OF THE SUBJECT SOFTWARE.  FURTHER, GOVERNMENT AGENCY DISCLAIMS ALL WARRANTIES AND LIABILITIES REGARDING THIRD-PARTY SOFTWARE, IF PRESENT IN THE ORIGINAL SOFTWARE, AND DISTRIBUTES IT "AS IS." 
 
# Waiver and Indemnity:  RECIPIENT AGREES TO WAIVE ANY AND ALL CLAIMS AGAINST THE UNITED STATES GOVERNMENT, ITS CONTRACTORS AND SUBCONTRACTORS, AS WELL AS ANY PRIOR RECIPIENT.  IF RECIPIENT'S USE OF THE SUBJECT SOFTWARE RESULTS IN ANY LIABILITIES, DEMANDS, DAMAGES, EXPENSES OR LOSSES ARISING FROM SUCH USE, INCLUDING ANY DAMAGES FROM PRODUCTS BASED ON, OR RESULTING FROM, RECIPIENT'S USE OF THE SUBJECT SOFTWARE, RECIPIENT SHALL INDEMNIFY AND HOLD HARMLESS THE UNITED STATES GOVERNMENT, ITS CONTRACTORS AND SUBCONTRACTORS, AS WELL AS ANY PRIOR RECIPIENT, TO THE EXTENT PERMITTED BY LAW.  RECIPIENT'S SOLE REMEDY FOR ANY SUCH MATTER SHALL BE THE IMMEDIATE, UNILATERAL TERMINATION OF THIS AGREEMENT.


# Parse command line arguments
if ! [ -z $1 ]; then
    dataDir=$1
else
    dataDir="data"
fi
if ! [ -z $2 ]; then
    envType=$2
else
    envType="roboschool"
fi
if ! [ -z $3 ]; then
    numTimesteps=$3
else
    numTimesteps=1000000
fi
if ! [ -z $4 ]; then
    nSeeds=$4
else
    nSeeds=3
fi

# Get list of environments
if [ "$envType" = "roboschool" ]; then
    envList=$(python getRoboschoolEnvList.py)
else
    envList=$(python getMujocoEnvList.py)
fi

# Define list of algorithms
algList=("a2c ddpg ppo2 trpo_mpi")

# Define seed sequence
seeds=$(seq 0 $(expr $nSeeds - 1))

# Loop over all environments
for env in $envList
do
    # Create directory to save data
    mkdir $PWD/$dataDir
    mkdir $PWD/$dataDir/$env
    # Loop over all algorithms
    for alg in $algList
    do
        # Run experiment for each seed
        for seed in $seeds; do OPENAI_LOGDIR=$PWD/$dataDir/$env/$alg-$seed OPENAI_LOG_FOMAT=csv python -m baselines.run --env=$env --alg=$alg --num_timesteps=$numTimesteps; done
    done
    # Plot the results
    python plotResults.py --env=$env --dir=$dataDir
done

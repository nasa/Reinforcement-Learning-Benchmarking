from baselines.common import plot_util as pu
import matplotlib.pyplot as plt
import argparse
import os

"""Create a plot of training data for a given environment using baselines plotting utility
Command line arguments:
--env: environment name (ex: --env=RoboschoolHalfCheetah-v1)
--dir: directory where training data is logged default is ./data/
"""

if __name__ == "__main__":
    # Parse command line arguments
    parser = argparse.ArgumentParser(formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument('--env', help='Environment name')
    parser.add_argument('--dir', help='Data directory', default='./data')
    args = parser.parse_args()
    envName = args.env
    # Load results with baselines plot utility
    results = pu.load_results('./'+args.dir+'/'+envName)
    # Plot results
    pu.plot_results(results, average_group=True, split_fn=lambda _: '', shaded_std=False)
    # Save plot as a pdf in a subdirectory of the data directory called plots
    if not os.path.exists('./'+args.dir+'/plots'):
        os.mkdir('./'+args.dir+'/plots')
    plt.savefig('./'+args.dir+'/plots/'+envName+'.pdf')


# Last modified 1/13/22 Xinjian Liu
#
# setup script for Bengroup Cadence Users
# include Spectre, Incisive and Innovus

# set license file
CDS_LIC_FILE=5280@license2.ece.virginia.edu
LM_LICENSE_FILE=$CDS_LIC_FILE

# Cadence and MMSIM set path
BASE_DIR=/app6/cadence
IC=$BASE_DIR/IC618
MMSIM=$BASE_DIR/SPECTRE181
IC_PATH=$IC/bin:$IC/tools/bin:$IC/tools/dfII/bin:$IC/tools/cdnshelp/bin:$IC/tools/stream_mgt/bin:$IC/tools/cdsdoc/bin:$IC/tools/plot/bin:$IC/tools/gcf/bin:$IC/tools/vframe/bin:$IC/tools/concice/bin:$IC/tools/coeffgen/bin:$IC/tools/dracula/bin:$IC/tools/sfe/bin:$IC/tools/verity/_ssol26/bin:$IC/tools/verity/bin:$IC/tools/mdl/bin:$IC/tools/tlfUtil/bin:$IC/tools/modelwriter/bin:$IC/tools/leapfrog/bin:$IC/tools/pearl/bin:$IC/tools/systemc/bin
MMSIM_PATH=$MMSIM/tools/bin:$MMSIM/tools/spectre/bin:$MMSIM/tools/spectre/ahdlcmi/bin

#Cadence Incisive set path
INCISIVE=$BASE_DIR/INCISIVE152
INCISIVE_PATH=$INCISIVE/bin:$INCISIVE/tools/bin:$INCISIVE/tools.lnx86/bin:$INCISIVE/tools/cdsgcc/gcc/bin

#Cadence Innovus set path
INNOVUS=$BASE_DIR/INNOVUS191
INNOVUS_PATH=$INNOVUS/bin:$INNOVUS/tools/bin:$INNOVUS/tools.lnx86/bin:/apps/ame/bin

# set path
PATH=$IC_PATH:$MMSIM_PATH:$INCISIVE_PATH:$INNOVUS_PATH:$PATH


# set LD_LIBRARY PATH
LD_LIBRARY_PATH=/lib64/:/lib:/usr/lib64:$IC/tools/lib:$LD_LIBRARY_PATH

# set Cadence home
CDSHOME=$IC

# set project root directory
VLSI_PROJECT_PATH=$(git rev-parse --show-toplevel)

# export variables
export CDS_LIC_FILE PATH LD_LIBRARY_PATH LM_LICENSE_FILE CDSHOME VLSI_PROJECT_PATH


# setenv for auCdl for LVS/PEX
export PDK_DIR=/app/lib/freepdk45/trunk
# copy required files from recommended area /app6/TSMC/... 

if  [ -f "${PWD}/.cdsinit" ]; then
   echo ".lib, lib.defs include Files exist"
else

 cp ${PDK_DIR}/ncsu_basekit/cdssetup/cdsinit ${PWD}/.cdsinit
 cp ${PDK_DIR}/ncsu_basekit/cdssetup/cds.lib ${PWD}/cds.lib
 cp ${PDK_DIR}/ncsu_basekit/cdssetup/lib.defs ${PWD}/lib.defs
 cp /app6/TSMC/Free45PDK/cadence/45_hspice_nom.include ${PWD}/.
 echo ".lib, lib.defs include Files exist. Created"

fi




#source /homenfs/redfox0u/share-misc/LiberateSetup
export CDS_Netlisting_Mode=Analog
echo -e "Cadence environment is set up.\nOcean is setup"
echo "Documents are under /app6/cadence/IC618/doc"

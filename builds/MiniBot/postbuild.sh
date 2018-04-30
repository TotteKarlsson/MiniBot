#! /bin/bash
echo "Hello Bash"

echo "Arg1: "$1
echo "Arg2: "$2
echo "Arg3: "$3
echo "Arg4: "$4

OUTPUTDIR=`cygpath $1`
APP_RELEASES=`cygpath $2`
OUTPUTFILENAME=$3
BDSCOMMONDIR=$4

echo "OUTPUTDIR: "$OUTPUTDIR
echo "AppReleases: "$APP_RELEASES
echo "Outputfilename: "$OUTPUTFILENAME
echo "BDSCOMMONDIR: "$BDSCOMMONDIR

#Extract version
VERSION=`cat ./../../ERSION.txt | tr -d '\r'`
APPNAME=MiniBot

echo "Copy stuff"
mkdir $APP_RELEASES/$APPNAME

dest=$APP_RELEASES/$APPNAME
SRC_DIR="./../../source"
cp $SRC_DIR/../*.txt                                    $dest
cp $SRC_DIR/*.ico                                   $dest
cp $OUTPUTDIR/$OUTPUTFILENAME                       $dest

#DS Binaries
cp $OUTPUTDIR/dslCommon.dll                         $dest
cp $OUTPUTDIR/dslIPC.dll                            $dest
cp $OUTPUTDIR/dslMath.dll                           $dest
cp $OUTPUTDIR/dslPlugins.dll                        $dest
cp $OUTPUTDIR/dslVCLCommon.dll                      $dest

cp $OUTPUTDIR/atFoundation.dll                      $dest
cp $OUTPUTDIR/atResources.dll                       $dest
cp $OUTPUTDIR/atBarcodeReader.dll                   $dest
cp $OUTPUTDIR/atArrayBotCore.dll                    $dest
cp $OUTPUTDIR/atVCLCommon.dll                       $dest
cp $OUTPUTDIR/atSSI.dll                             $dest

cp $BDSCOMMONDIR/BPL/dslVCLComponents.bpl          $dest
cp $BDSCOMMONDIR/BPL/dslVCLVisualComponents.bpl    $dest
cp $BDSCOMMONDIR/BPL/atVCLComponents.bpl           $dest    
cp $BDSCOMMONDIR/BPL/atVCLVisualComponents.bpl     $dest    
cp $BDSCOMMONDIR/BPL/atVCLAPTVisualComponents.bpl  $dest    
cp $BDSCOMMONDIR/BPL/atVCLDataModules.bpl          $dest    

#Borland Packages and dll's
CG_REDIST="/cygdrive/c/CodeGear/Tokyo/bin"

cp $CG_REDIST/borlndmm.dll                         $dest
cp $CG_REDIST/cc32250mt.dll                        $dest

suffix="250.bpl"
cp $CG_REDIST/bcbsmp$suffix                        $dest
cp $CG_REDIST/dbexpress$suffix                     $dest
cp $CG_REDIST/dbrtl$suffix                         $dest
cp $CG_REDIST/dbxcds$suffix                        $dest
cp $CG_REDIST/DBXCommonDriver$suffix               $dest
cp $CG_REDIST/DBXDevartPostgreSQLDriver$suffix     $dest
cp $CG_REDIST/DBXMySQLDriver$suffix                $dest
cp $CG_REDIST/dsnap$suffix                         $dest
cp $CG_REDIST/rtl$suffix                           $dest
cp $CG_REDIST/vcl$suffix                           $dest
cp $CG_REDIST/vclactnband$suffix                   $dest
cp $CG_REDIST/vclimg$suffix                        $dest
cp $CG_REDIST/vclx$suffix                          $dest
cp $CG_REDIST/tee9$suffix                          $dest
cp $CG_REDIST/vcldb$suffix                         $dest
cp $CG_REDIST/midas.dll                            $dest


#Other 3rd Party binaries
miscRedist="/cygdrive/p/redist"
cp $miscRedist/navusbapi.dll                                        $dest
cp $miscRedist/Thorlabs.MotionControl.TCube.StepperMotor.dll        $dest
cp $miscRedist/Thorlabs.MotionControl.TDIEngine.dll                 $dest
cp $miscRedist/Thorlabs.MotionControl.IntegratedStepperMotors.dll   $dest
cp $miscRedist/Thorlabs.MotionControl.TCube.DCServo.dll             $dest
cp $miscRedist/Thorlabs.MotionControl.Benchtop.StepperMotor.dll     $dest
cp $miscRedist/Thorlabs.MotionControl.DeviceManager.dll             $dest
cp $miscRedist/dbexppgsql40.dll                                     $dest

#instead of using local bin folder
cp $miscRedist/navusbapi.dll                                        $OUTPUTDIR
cp $miscRedist/Thorlabs.MotionControl.TCube.StepperMotor.dll        $OUTPUTDIR
cp $miscRedist/Thorlabs.MotionControl.TDIEngine.dll                 $OUTPUTDIR
cp $miscRedist/Thorlabs.MotionControl.IntegratedStepperMotors.dll   $OUTPUTDIR
cp $miscRedist/Thorlabs.MotionControl.TCube.DCServo.dll             $OUTPUTDIR
cp $miscRedist/Thorlabs.MotionControl.Benchtop.StepperMotor.dll     $OUTPUTDIR
cp $miscRedist/Thorlabs.MotionControl.DeviceManager.dll             $OUTPUTDIR
cp $SRC_DIR/../*.txt                                                $OUTPUTDIR
cp $SRC_DIR/*.ico                                                   $OUTPUTDIR


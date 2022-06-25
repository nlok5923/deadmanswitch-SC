async function main() {
    const deadMan = await ethers.getContractFactory("DeadManSwitch");
    const deadManDeployInstance = await deadMan.deploy();
    console.log("Contract deployed to address:", deadManDeployInstance.address);
 }
 
 main()
   .then(() => process.exit(0))
   .catch(error => {
     console.error(error);
     process.exit(1);
   });
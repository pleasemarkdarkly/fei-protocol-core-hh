import hre from "hardhat";
import { Artifact } from "hardhat/types";
import { SignerWithAddress } from "@nomiclabs/hardhat-ethers/dist/src/signer-with-address";

// import { Permissions, Core, Timelock, GovernorAlpha } from "../../typechain";
import { Signers } from "../../types";
import { shouldBehaveLikeCore } from "./Core.behavior";

const { deployContract } = hre.waffle;

describe("Fei Signers initializing", function () {
    before(async function () {
        this.signers = {} as Signers;
        const signers: SignerWithAddress[] = await hre.ethers.getSigners();
        this.signers.admin = signers[0];
        this.gamblers = [] as Signers[];
        for (let i = 1; i <= (signers.length - 1); i++) {
            const gambler: SignerWithAddress = signers[i];
            this.gamblers.push(gambler);
        }
    });

    /*
    describe("Fei Core initializing", function () {
        before(async function () {            
            const permissionsArtifact: Artifact = await hre.artifacts.readArtifact("Permissions");
            this.permissions = <Permissions>await deployContract(this.signers.admin, permissionsArtifact, []);
        });

        shouldBehaveLikeCore();
    });
    */
    
});

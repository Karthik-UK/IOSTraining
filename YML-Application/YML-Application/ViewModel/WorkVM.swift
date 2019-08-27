import Foundation
class WorkVM{
    var workInform : [workConstants] = []
    func WorkUIConstants(){
        let worktab = [workConstants(workimage: "north-face-featured-1", worktitle: "THE NORTH FACE",  workdescription: "How The North Face redefined loyalty to embrace the great outdoors.",workurl: "https://ymedialabs.com/project/the-north-face"),workConstants(workimage: "clover-featured", worktitle: "CLOVER", workdescription: "How Clover Go has become an open ecosystem for point-of-sale payments. ",workurl: "https://ymedialabs.com/project/clover"),workConstants(workimage: "creditone-featured", worktitle:  "CREDIT ONE", workdescription: "How Credit One has become America's fastest-growing credit card issuer.",workurl: "https://ymedialabs.com/project/credit-one")]
      workInform = worktab
    }
}

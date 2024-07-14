interface ITreeNode {
  val: number;
  left: ITreeNode | null;
  right: ITreeNode | null;
}

interface TreeNodeParams {
  val?: number;
  left?: ITreeNode | null;
  right?: ITreeNode | null;
}

// Definition for a binary tree node.
class TreeNode {
  val: number;
  left: TreeNode | null;
  right: TreeNode | null;

  constructor({ val = 0, left = null, right = null }: TreeNodeParams = {}) {
    this.val = val;
    this.left = left;
    this.right = right;
  }
}

export default TreeNode;

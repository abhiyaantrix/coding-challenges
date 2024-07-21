import TreeNode from './tree_node';

// Simple Binary Tree data structure based on TreeNode
class BinaryTree {
  root: TreeNode | null;

  constructor(node_values: number[]) {
    this.root = this.build(node_values);
  }

  private build(values: (number | null)[]): TreeNode | null {
    if (!values || values.length === 0) return null;

    const rootNode = new TreeNode({ val: values[0]! });

    const queue: (TreeNode | null)[] = [rootNode];

    let index = 1;

    while (index < values.length) {
      const currentNode = queue.shift();

      if (currentNode) {
        if (values[index] !== null) {
          currentNode.left = new TreeNode({ val: values[index]! });

          queue.push(currentNode.left);
        }

        index++;

        if (index >= values.length) break;

        if (values[index] !== null) {
          currentNode.right = new TreeNode({ val: values[index]! });

          queue.push(currentNode.right);
        }
        index++;
      }
    }

    return rootNode;
  }

  toArray(): (number | null)[] {
    if (!this.root) return [];

    const arr: (number | null)[] = [];
    const queue: (TreeNode | null)[] = [this.root];

    while (queue.length > 0) {
      const currentNode = queue.shift();

      if (currentNode) {
        arr.push(currentNode.val);
        queue.push(currentNode.left);
        queue.push(currentNode.right);
      } else {
        if (queue.some((node) => node !== null)) {
          arr.push(null);
        }
      }
    }

    return arr;
  }
}

export default BinaryTree;

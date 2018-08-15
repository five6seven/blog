/**
 * Created by Administrator on 2017/11/21.
 */
public class test {
        public int[] twoSum(int[] nums, int target) {
            int a,b,sum;
            int[] reu = new int[2];
            for(int i=0;i<nums.length;i++){
                for(int j=1;j<nums.length;j++){
                    sum = nums[i]+nums[j];
                    if(sum == target){
                        reu[0] = i;
                        reu[1] = j;
                    }
                }
            }
            return reu;
        }
    public static void main(String[] args){
            test t = new test();
            int[] a ={1,2,3};
            System.out.print(t.twoSum(a,3));
    }
}

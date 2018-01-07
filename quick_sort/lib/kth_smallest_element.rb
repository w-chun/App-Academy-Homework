class Array

 def kth_smallest_element(k)
   left = 0
   right = self.length - 1
   while true
     return self[left] if left == right
     pivot_idx = Array.partition(self, left, right-left+1)
     if k-1 == pivot_idx
       return self[k-1]
     elsif k-1 < pivot_idx
       right = pivot_idx - 1
     else
       left = pivot_idx + 1
     end
   end
 end

end

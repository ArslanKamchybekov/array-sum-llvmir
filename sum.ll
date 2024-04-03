define i32 @sum_array(i32* %array, i32 %size) {
entry:
  ; Initialize sum to 0
  %sum = alloca i32
  store i32 0, i32* %sum
  
  ; Loop through the array
  %i = alloca i32
  store i32 0, i32* %i
  
  br label %loop_check

loop_check:
  ; Compare current index with size
  %current_index = load i32, i32* %i
  %compare = icmp slt i32 %current_index, %size
  br i1 %compare, label %loop_body, label %loop_exit

loop_body:
  ; Load the current element from the array
  %element_ptr = getelementptr i32, i32* %array, i32 %current_index
  %element_value = load i32, i32* %element_ptr
  
  ; Add the current element to the sum
  %current_sum = load i32, i32* %sum
  %new_sum = add i32 %current_sum, %element_value
  store i32 %new_sum, i32* %sum
  
  ; Increment the index
  %next_index = add i32 %current_index, 1
  store i32 %next_index, i32* %i
  
  br label %loop_check

loop_exit:
  ; Return the sum
  %final_sum = load i32, i32* %sum
  ret i32 %final_sum
}
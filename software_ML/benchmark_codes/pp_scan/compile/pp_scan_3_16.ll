; ModuleID = 'pp_scan_3_16.ll'
source_filename = "pp_scan_3_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%u\09\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @print(i32* %a, i32 %size) #0 {
entry:
  %cmp1 = icmp sgt i32 %size, 0
  br i1 %cmp1, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %size to i64
  br label %for.body

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next, %for.body ]
  %arrayidx = getelementptr inbounds i32, i32* %a, i64 %indvars.iv
  %0 = load i32, i32* %arrayidx, align 4
  %call = call i32 (i8*, ...) @printf(i8* nonnull dereferenceable(1) getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %0) #4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp ne i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.body, label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.body
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  ret void
}

declare dso_local i32 @printf(i8*, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local void @local_scan(i32* %bucket) #0 {
entry:
  br label %for.body

for.body:                                         ; preds = %entry, %for.inc9
  %indvars.iv6 = phi i64 [ 0, %entry ], [ %indvars.iv.next7, %for.inc9 ]
  br label %for.body3

for.body3:                                        ; preds = %for.body, %for.body3
  %indvars.iv = phi i64 [ 1, %for.body ], [ %indvars.iv.next, %for.body3 ]
  %0 = shl nsw i64 %indvars.iv6, 4
  %1 = add nuw nsw i64 %0, %indvars.iv
  %2 = add nsw i64 %1, -1
  %arrayidx = getelementptr inbounds i32, i32* %bucket, i64 %2
  %3 = load i32, i32* %arrayidx, align 4
  %4 = shl nsw i64 %indvars.iv6, 4
  %5 = add nuw nsw i64 %4, %indvars.iv
  %arrayidx7 = getelementptr inbounds i32, i32* %bucket, i64 %5
  %6 = load i32, i32* %arrayidx7, align 4
  %add8 = add nsw i32 %6, %3
  store i32 %add8, i32* %arrayidx7, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp ne i64 %indvars.iv.next, 16
  br i1 %exitcond, label %for.body3, label %for.inc9, !llvm.loop !2

for.inc9:                                         ; preds = %for.body3
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond10 = icmp ne i64 %indvars.iv.next7, 524288
  br i1 %exitcond10, label %for.body, label %for.end11, !llvm.loop !4

for.end11:                                        ; preds = %for.inc9
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @sum_scan(i32* %sum, i32* %bucket) #0 {
entry:
  store i32 0, i32* %sum, align 4
  br label %for.body

for.body:                                         ; preds = %entry, %for.body
  %indvars.iv = phi i64 [ 1, %entry ], [ %indvars.iv.next, %for.body ]
  %0 = add nsw i64 %indvars.iv, -1
  %arrayidx1 = getelementptr inbounds i32, i32* %sum, i64 %0
  %1 = load i32, i32* %arrayidx1, align 4
  %2 = shl nsw i64 %indvars.iv, 4
  %3 = add nsw i64 %2, -1
  %arrayidx4 = getelementptr inbounds i32, i32* %bucket, i64 %3
  %4 = load i32, i32* %arrayidx4, align 4
  %add = add nsw i32 %1, %4
  %arrayidx6 = getelementptr inbounds i32, i32* %sum, i64 %indvars.iv
  store i32 %add, i32* %arrayidx6, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp ne i64 %indvars.iv.next, 524288
  br i1 %exitcond, label %for.body, label %for.end, !llvm.loop !5

for.end:                                          ; preds = %for.body
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @last_step_scan(i32* %bucket, i32* %bucket2, i32* %sum) #0 {
entry:
  br label %for.body

for.body:                                         ; preds = %for.inc11.15, %entry
  %indvars.iv5 = phi i64 [ 0, %entry ], [ %indvars.iv.next6.15, %for.inc11.15 ]
  br label %for.body3

for.body3:                                        ; preds = %for.body, %for.body3
  %indvars.iv = phi i64 [ 0, %for.body ], [ %indvars.iv.next, %for.body3 ]
  %0 = shl nsw i64 %indvars.iv5, 4
  %1 = add nuw nsw i64 %0, %indvars.iv
  %arrayidx = getelementptr inbounds i32, i32* %bucket, i64 %1
  %2 = load i32, i32* %arrayidx, align 4
  %arrayidx5 = getelementptr inbounds i32, i32* %sum, i64 %indvars.iv5
  %3 = load i32, i32* %arrayidx5, align 4
  %add6 = add nsw i32 %2, %3
  %4 = shl nsw i64 %indvars.iv5, 4
  %5 = add nuw nsw i64 %4, %indvars.iv
  %arrayidx10 = getelementptr inbounds i32, i32* %bucket2, i64 %5
  store i32 %add6, i32* %arrayidx10, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp ne i64 %indvars.iv.next, 16
  br i1 %exitcond, label %for.body3, label %for.inc11, !llvm.loop !6

for.inc11:                                        ; preds = %for.body3
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  br label %for.body3.1

for.end13:                                        ; preds = %for.inc11.15
  ret void

for.body3.1:                                      ; preds = %for.body3.1, %for.inc11
  %indvars.iv.1 = phi i64 [ 0, %for.inc11 ], [ %indvars.iv.next.1, %for.body3.1 ]
  %6 = shl nsw i64 %indvars.iv.next6, 4
  %7 = add nuw nsw i64 %6, %indvars.iv.1
  %arrayidx.1 = getelementptr inbounds i32, i32* %bucket, i64 %7
  %8 = load i32, i32* %arrayidx.1, align 4
  %arrayidx5.1 = getelementptr inbounds i32, i32* %sum, i64 %indvars.iv.next6
  %9 = load i32, i32* %arrayidx5.1, align 4
  %add6.1 = add nsw i32 %8, %9
  %10 = shl nsw i64 %indvars.iv.next6, 4
  %11 = add nuw nsw i64 %10, %indvars.iv.1
  %arrayidx10.1 = getelementptr inbounds i32, i32* %bucket2, i64 %11
  store i32 %add6.1, i32* %arrayidx10.1, align 4
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv.1, 1
  %exitcond.1 = icmp ne i64 %indvars.iv.next.1, 16
  br i1 %exitcond.1, label %for.body3.1, label %for.inc11.1, !llvm.loop !6

for.inc11.1:                                      ; preds = %for.body3.1
  %indvars.iv.next6.1 = add nuw nsw i64 %indvars.iv.next6, 1
  br label %for.body3.2

for.body3.2:                                      ; preds = %for.body3.2, %for.inc11.1
  %indvars.iv.2 = phi i64 [ 0, %for.inc11.1 ], [ %indvars.iv.next.2, %for.body3.2 ]
  %12 = shl nsw i64 %indvars.iv.next6.1, 4
  %13 = add nuw nsw i64 %12, %indvars.iv.2
  %arrayidx.2 = getelementptr inbounds i32, i32* %bucket, i64 %13
  %14 = load i32, i32* %arrayidx.2, align 4
  %arrayidx5.2 = getelementptr inbounds i32, i32* %sum, i64 %indvars.iv.next6.1
  %15 = load i32, i32* %arrayidx5.2, align 4
  %add6.2 = add nsw i32 %14, %15
  %16 = shl nsw i64 %indvars.iv.next6.1, 4
  %17 = add nuw nsw i64 %16, %indvars.iv.2
  %arrayidx10.2 = getelementptr inbounds i32, i32* %bucket2, i64 %17
  store i32 %add6.2, i32* %arrayidx10.2, align 4
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv.2, 1
  %exitcond.2 = icmp ne i64 %indvars.iv.next.2, 16
  br i1 %exitcond.2, label %for.body3.2, label %for.inc11.2, !llvm.loop !6

for.inc11.2:                                      ; preds = %for.body3.2
  %indvars.iv.next6.2 = add nuw nsw i64 %indvars.iv.next6.1, 1
  br label %for.body3.3

for.body3.3:                                      ; preds = %for.body3.3, %for.inc11.2
  %indvars.iv.3 = phi i64 [ 0, %for.inc11.2 ], [ %indvars.iv.next.3, %for.body3.3 ]
  %18 = shl nsw i64 %indvars.iv.next6.2, 4
  %19 = add nuw nsw i64 %18, %indvars.iv.3
  %arrayidx.3 = getelementptr inbounds i32, i32* %bucket, i64 %19
  %20 = load i32, i32* %arrayidx.3, align 4
  %arrayidx5.3 = getelementptr inbounds i32, i32* %sum, i64 %indvars.iv.next6.2
  %21 = load i32, i32* %arrayidx5.3, align 4
  %add6.3 = add nsw i32 %20, %21
  %22 = shl nsw i64 %indvars.iv.next6.2, 4
  %23 = add nuw nsw i64 %22, %indvars.iv.3
  %arrayidx10.3 = getelementptr inbounds i32, i32* %bucket2, i64 %23
  store i32 %add6.3, i32* %arrayidx10.3, align 4
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv.3, 1
  %exitcond.3 = icmp ne i64 %indvars.iv.next.3, 16
  br i1 %exitcond.3, label %for.body3.3, label %for.inc11.3, !llvm.loop !6

for.inc11.3:                                      ; preds = %for.body3.3
  %indvars.iv.next6.3 = add nuw nsw i64 %indvars.iv.next6.2, 1
  br label %for.body3.4

for.body3.4:                                      ; preds = %for.body3.4, %for.inc11.3
  %indvars.iv.4 = phi i64 [ 0, %for.inc11.3 ], [ %indvars.iv.next.4, %for.body3.4 ]
  %24 = shl nsw i64 %indvars.iv.next6.3, 4
  %25 = add nuw nsw i64 %24, %indvars.iv.4
  %arrayidx.4 = getelementptr inbounds i32, i32* %bucket, i64 %25
  %26 = load i32, i32* %arrayidx.4, align 4
  %arrayidx5.4 = getelementptr inbounds i32, i32* %sum, i64 %indvars.iv.next6.3
  %27 = load i32, i32* %arrayidx5.4, align 4
  %add6.4 = add nsw i32 %26, %27
  %28 = shl nsw i64 %indvars.iv.next6.3, 4
  %29 = add nuw nsw i64 %28, %indvars.iv.4
  %arrayidx10.4 = getelementptr inbounds i32, i32* %bucket2, i64 %29
  store i32 %add6.4, i32* %arrayidx10.4, align 4
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv.4, 1
  %exitcond.4 = icmp ne i64 %indvars.iv.next.4, 16
  br i1 %exitcond.4, label %for.body3.4, label %for.inc11.4, !llvm.loop !6

for.inc11.4:                                      ; preds = %for.body3.4
  %indvars.iv.next6.4 = add nuw nsw i64 %indvars.iv.next6.3, 1
  br label %for.body3.5

for.body3.5:                                      ; preds = %for.body3.5, %for.inc11.4
  %indvars.iv.5 = phi i64 [ 0, %for.inc11.4 ], [ %indvars.iv.next.5, %for.body3.5 ]
  %30 = shl nsw i64 %indvars.iv.next6.4, 4
  %31 = add nuw nsw i64 %30, %indvars.iv.5
  %arrayidx.5 = getelementptr inbounds i32, i32* %bucket, i64 %31
  %32 = load i32, i32* %arrayidx.5, align 4
  %arrayidx5.5 = getelementptr inbounds i32, i32* %sum, i64 %indvars.iv.next6.4
  %33 = load i32, i32* %arrayidx5.5, align 4
  %add6.5 = add nsw i32 %32, %33
  %34 = shl nsw i64 %indvars.iv.next6.4, 4
  %35 = add nuw nsw i64 %34, %indvars.iv.5
  %arrayidx10.5 = getelementptr inbounds i32, i32* %bucket2, i64 %35
  store i32 %add6.5, i32* %arrayidx10.5, align 4
  %indvars.iv.next.5 = add nuw nsw i64 %indvars.iv.5, 1
  %exitcond.5 = icmp ne i64 %indvars.iv.next.5, 16
  br i1 %exitcond.5, label %for.body3.5, label %for.inc11.5, !llvm.loop !6

for.inc11.5:                                      ; preds = %for.body3.5
  %indvars.iv.next6.5 = add nuw nsw i64 %indvars.iv.next6.4, 1
  br label %for.body3.6

for.body3.6:                                      ; preds = %for.body3.6, %for.inc11.5
  %indvars.iv.6 = phi i64 [ 0, %for.inc11.5 ], [ %indvars.iv.next.6, %for.body3.6 ]
  %36 = shl nsw i64 %indvars.iv.next6.5, 4
  %37 = add nuw nsw i64 %36, %indvars.iv.6
  %arrayidx.6 = getelementptr inbounds i32, i32* %bucket, i64 %37
  %38 = load i32, i32* %arrayidx.6, align 4
  %arrayidx5.6 = getelementptr inbounds i32, i32* %sum, i64 %indvars.iv.next6.5
  %39 = load i32, i32* %arrayidx5.6, align 4
  %add6.6 = add nsw i32 %38, %39
  %40 = shl nsw i64 %indvars.iv.next6.5, 4
  %41 = add nuw nsw i64 %40, %indvars.iv.6
  %arrayidx10.6 = getelementptr inbounds i32, i32* %bucket2, i64 %41
  store i32 %add6.6, i32* %arrayidx10.6, align 4
  %indvars.iv.next.6 = add nuw nsw i64 %indvars.iv.6, 1
  %exitcond.6 = icmp ne i64 %indvars.iv.next.6, 16
  br i1 %exitcond.6, label %for.body3.6, label %for.inc11.6, !llvm.loop !6

for.inc11.6:                                      ; preds = %for.body3.6
  %indvars.iv.next6.6 = add nuw nsw i64 %indvars.iv.next6.5, 1
  br label %for.body3.7

for.body3.7:                                      ; preds = %for.body3.7, %for.inc11.6
  %indvars.iv.7 = phi i64 [ 0, %for.inc11.6 ], [ %indvars.iv.next.7, %for.body3.7 ]
  %42 = shl nsw i64 %indvars.iv.next6.6, 4
  %43 = add nuw nsw i64 %42, %indvars.iv.7
  %arrayidx.7 = getelementptr inbounds i32, i32* %bucket, i64 %43
  %44 = load i32, i32* %arrayidx.7, align 4
  %arrayidx5.7 = getelementptr inbounds i32, i32* %sum, i64 %indvars.iv.next6.6
  %45 = load i32, i32* %arrayidx5.7, align 4
  %add6.7 = add nsw i32 %44, %45
  %46 = shl nsw i64 %indvars.iv.next6.6, 4
  %47 = add nuw nsw i64 %46, %indvars.iv.7
  %arrayidx10.7 = getelementptr inbounds i32, i32* %bucket2, i64 %47
  store i32 %add6.7, i32* %arrayidx10.7, align 4
  %indvars.iv.next.7 = add nuw nsw i64 %indvars.iv.7, 1
  %exitcond.7 = icmp ne i64 %indvars.iv.next.7, 16
  br i1 %exitcond.7, label %for.body3.7, label %for.inc11.7, !llvm.loop !6

for.inc11.7:                                      ; preds = %for.body3.7
  %indvars.iv.next6.7 = add nuw nsw i64 %indvars.iv.next6.6, 1
  br label %for.body3.8

for.body3.8:                                      ; preds = %for.body3.8, %for.inc11.7
  %indvars.iv.8 = phi i64 [ 0, %for.inc11.7 ], [ %indvars.iv.next.8, %for.body3.8 ]
  %48 = shl nsw i64 %indvars.iv.next6.7, 4
  %49 = add nuw nsw i64 %48, %indvars.iv.8
  %arrayidx.8 = getelementptr inbounds i32, i32* %bucket, i64 %49
  %50 = load i32, i32* %arrayidx.8, align 4
  %arrayidx5.8 = getelementptr inbounds i32, i32* %sum, i64 %indvars.iv.next6.7
  %51 = load i32, i32* %arrayidx5.8, align 4
  %add6.8 = add nsw i32 %50, %51
  %52 = shl nsw i64 %indvars.iv.next6.7, 4
  %53 = add nuw nsw i64 %52, %indvars.iv.8
  %arrayidx10.8 = getelementptr inbounds i32, i32* %bucket2, i64 %53
  store i32 %add6.8, i32* %arrayidx10.8, align 4
  %indvars.iv.next.8 = add nuw nsw i64 %indvars.iv.8, 1
  %exitcond.8 = icmp ne i64 %indvars.iv.next.8, 16
  br i1 %exitcond.8, label %for.body3.8, label %for.inc11.8, !llvm.loop !6

for.inc11.8:                                      ; preds = %for.body3.8
  %indvars.iv.next6.8 = add nuw nsw i64 %indvars.iv.next6.7, 1
  br label %for.body3.9

for.body3.9:                                      ; preds = %for.body3.9, %for.inc11.8
  %indvars.iv.9 = phi i64 [ 0, %for.inc11.8 ], [ %indvars.iv.next.9, %for.body3.9 ]
  %54 = shl nsw i64 %indvars.iv.next6.8, 4
  %55 = add nuw nsw i64 %54, %indvars.iv.9
  %arrayidx.9 = getelementptr inbounds i32, i32* %bucket, i64 %55
  %56 = load i32, i32* %arrayidx.9, align 4
  %arrayidx5.9 = getelementptr inbounds i32, i32* %sum, i64 %indvars.iv.next6.8
  %57 = load i32, i32* %arrayidx5.9, align 4
  %add6.9 = add nsw i32 %56, %57
  %58 = shl nsw i64 %indvars.iv.next6.8, 4
  %59 = add nuw nsw i64 %58, %indvars.iv.9
  %arrayidx10.9 = getelementptr inbounds i32, i32* %bucket2, i64 %59
  store i32 %add6.9, i32* %arrayidx10.9, align 4
  %indvars.iv.next.9 = add nuw nsw i64 %indvars.iv.9, 1
  %exitcond.9 = icmp ne i64 %indvars.iv.next.9, 16
  br i1 %exitcond.9, label %for.body3.9, label %for.inc11.9, !llvm.loop !6

for.inc11.9:                                      ; preds = %for.body3.9
  %indvars.iv.next6.9 = add nuw nsw i64 %indvars.iv.next6.8, 1
  br label %for.body3.10

for.body3.10:                                     ; preds = %for.body3.10, %for.inc11.9
  %indvars.iv.10 = phi i64 [ 0, %for.inc11.9 ], [ %indvars.iv.next.10, %for.body3.10 ]
  %60 = shl nsw i64 %indvars.iv.next6.9, 4
  %61 = add nuw nsw i64 %60, %indvars.iv.10
  %arrayidx.10 = getelementptr inbounds i32, i32* %bucket, i64 %61
  %62 = load i32, i32* %arrayidx.10, align 4
  %arrayidx5.10 = getelementptr inbounds i32, i32* %sum, i64 %indvars.iv.next6.9
  %63 = load i32, i32* %arrayidx5.10, align 4
  %add6.10 = add nsw i32 %62, %63
  %64 = shl nsw i64 %indvars.iv.next6.9, 4
  %65 = add nuw nsw i64 %64, %indvars.iv.10
  %arrayidx10.10 = getelementptr inbounds i32, i32* %bucket2, i64 %65
  store i32 %add6.10, i32* %arrayidx10.10, align 4
  %indvars.iv.next.10 = add nuw nsw i64 %indvars.iv.10, 1
  %exitcond.10 = icmp ne i64 %indvars.iv.next.10, 16
  br i1 %exitcond.10, label %for.body3.10, label %for.inc11.10, !llvm.loop !6

for.inc11.10:                                     ; preds = %for.body3.10
  %indvars.iv.next6.10 = add nuw nsw i64 %indvars.iv.next6.9, 1
  br label %for.body3.11

for.body3.11:                                     ; preds = %for.body3.11, %for.inc11.10
  %indvars.iv.11 = phi i64 [ 0, %for.inc11.10 ], [ %indvars.iv.next.11, %for.body3.11 ]
  %66 = shl nsw i64 %indvars.iv.next6.10, 4
  %67 = add nuw nsw i64 %66, %indvars.iv.11
  %arrayidx.11 = getelementptr inbounds i32, i32* %bucket, i64 %67
  %68 = load i32, i32* %arrayidx.11, align 4
  %arrayidx5.11 = getelementptr inbounds i32, i32* %sum, i64 %indvars.iv.next6.10
  %69 = load i32, i32* %arrayidx5.11, align 4
  %add6.11 = add nsw i32 %68, %69
  %70 = shl nsw i64 %indvars.iv.next6.10, 4
  %71 = add nuw nsw i64 %70, %indvars.iv.11
  %arrayidx10.11 = getelementptr inbounds i32, i32* %bucket2, i64 %71
  store i32 %add6.11, i32* %arrayidx10.11, align 4
  %indvars.iv.next.11 = add nuw nsw i64 %indvars.iv.11, 1
  %exitcond.11 = icmp ne i64 %indvars.iv.next.11, 16
  br i1 %exitcond.11, label %for.body3.11, label %for.inc11.11, !llvm.loop !6

for.inc11.11:                                     ; preds = %for.body3.11
  %indvars.iv.next6.11 = add nuw nsw i64 %indvars.iv.next6.10, 1
  br label %for.body3.12

for.body3.12:                                     ; preds = %for.body3.12, %for.inc11.11
  %indvars.iv.12 = phi i64 [ 0, %for.inc11.11 ], [ %indvars.iv.next.12, %for.body3.12 ]
  %72 = shl nsw i64 %indvars.iv.next6.11, 4
  %73 = add nuw nsw i64 %72, %indvars.iv.12
  %arrayidx.12 = getelementptr inbounds i32, i32* %bucket, i64 %73
  %74 = load i32, i32* %arrayidx.12, align 4
  %arrayidx5.12 = getelementptr inbounds i32, i32* %sum, i64 %indvars.iv.next6.11
  %75 = load i32, i32* %arrayidx5.12, align 4
  %add6.12 = add nsw i32 %74, %75
  %76 = shl nsw i64 %indvars.iv.next6.11, 4
  %77 = add nuw nsw i64 %76, %indvars.iv.12
  %arrayidx10.12 = getelementptr inbounds i32, i32* %bucket2, i64 %77
  store i32 %add6.12, i32* %arrayidx10.12, align 4
  %indvars.iv.next.12 = add nuw nsw i64 %indvars.iv.12, 1
  %exitcond.12 = icmp ne i64 %indvars.iv.next.12, 16
  br i1 %exitcond.12, label %for.body3.12, label %for.inc11.12, !llvm.loop !6

for.inc11.12:                                     ; preds = %for.body3.12
  %indvars.iv.next6.12 = add nuw nsw i64 %indvars.iv.next6.11, 1
  br label %for.body3.13

for.body3.13:                                     ; preds = %for.body3.13, %for.inc11.12
  %indvars.iv.13 = phi i64 [ 0, %for.inc11.12 ], [ %indvars.iv.next.13, %for.body3.13 ]
  %78 = shl nsw i64 %indvars.iv.next6.12, 4
  %79 = add nuw nsw i64 %78, %indvars.iv.13
  %arrayidx.13 = getelementptr inbounds i32, i32* %bucket, i64 %79
  %80 = load i32, i32* %arrayidx.13, align 4
  %arrayidx5.13 = getelementptr inbounds i32, i32* %sum, i64 %indvars.iv.next6.12
  %81 = load i32, i32* %arrayidx5.13, align 4
  %add6.13 = add nsw i32 %80, %81
  %82 = shl nsw i64 %indvars.iv.next6.12, 4
  %83 = add nuw nsw i64 %82, %indvars.iv.13
  %arrayidx10.13 = getelementptr inbounds i32, i32* %bucket2, i64 %83
  store i32 %add6.13, i32* %arrayidx10.13, align 4
  %indvars.iv.next.13 = add nuw nsw i64 %indvars.iv.13, 1
  %exitcond.13 = icmp ne i64 %indvars.iv.next.13, 16
  br i1 %exitcond.13, label %for.body3.13, label %for.inc11.13, !llvm.loop !6

for.inc11.13:                                     ; preds = %for.body3.13
  %indvars.iv.next6.13 = add nuw nsw i64 %indvars.iv.next6.12, 1
  br label %for.body3.14

for.body3.14:                                     ; preds = %for.body3.14, %for.inc11.13
  %indvars.iv.14 = phi i64 [ 0, %for.inc11.13 ], [ %indvars.iv.next.14, %for.body3.14 ]
  %84 = shl nsw i64 %indvars.iv.next6.13, 4
  %85 = add nuw nsw i64 %84, %indvars.iv.14
  %arrayidx.14 = getelementptr inbounds i32, i32* %bucket, i64 %85
  %86 = load i32, i32* %arrayidx.14, align 4
  %arrayidx5.14 = getelementptr inbounds i32, i32* %sum, i64 %indvars.iv.next6.13
  %87 = load i32, i32* %arrayidx5.14, align 4
  %add6.14 = add nsw i32 %86, %87
  %88 = shl nsw i64 %indvars.iv.next6.13, 4
  %89 = add nuw nsw i64 %88, %indvars.iv.14
  %arrayidx10.14 = getelementptr inbounds i32, i32* %bucket2, i64 %89
  store i32 %add6.14, i32* %arrayidx10.14, align 4
  %indvars.iv.next.14 = add nuw nsw i64 %indvars.iv.14, 1
  %exitcond.14 = icmp ne i64 %indvars.iv.next.14, 16
  br i1 %exitcond.14, label %for.body3.14, label %for.inc11.14, !llvm.loop !6

for.inc11.14:                                     ; preds = %for.body3.14
  %indvars.iv.next6.14 = add nuw nsw i64 %indvars.iv.next6.13, 1
  br label %for.body3.15

for.body3.15:                                     ; preds = %for.body3.15, %for.inc11.14
  %indvars.iv.15 = phi i64 [ 0, %for.inc11.14 ], [ %indvars.iv.next.15, %for.body3.15 ]
  %90 = shl nsw i64 %indvars.iv.next6.14, 4
  %91 = add nuw nsw i64 %90, %indvars.iv.15
  %arrayidx.15 = getelementptr inbounds i32, i32* %bucket, i64 %91
  %92 = load i32, i32* %arrayidx.15, align 4
  %arrayidx5.15 = getelementptr inbounds i32, i32* %sum, i64 %indvars.iv.next6.14
  %93 = load i32, i32* %arrayidx5.15, align 4
  %add6.15 = add nsw i32 %92, %93
  %94 = shl nsw i64 %indvars.iv.next6.14, 4
  %95 = add nuw nsw i64 %94, %indvars.iv.15
  %arrayidx10.15 = getelementptr inbounds i32, i32* %bucket2, i64 %95
  store i32 %add6.15, i32* %arrayidx10.15, align 4
  %indvars.iv.next.15 = add nuw nsw i64 %indvars.iv.15, 1
  %exitcond.15 = icmp ne i64 %indvars.iv.next.15, 16
  br i1 %exitcond.15, label %for.body3.15, label %for.inc11.15, !llvm.loop !6

for.inc11.15:                                     ; preds = %for.body3.15
  %indvars.iv.next6.15 = add nuw nsw i64 %indvars.iv.next6.14, 1
  %exitcond10.15 = icmp ne i64 %indvars.iv.next6.15, 524288
  br i1 %exitcond10.15, label %for.body, label %for.end13, !llvm.loop !7
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @pp_scan(i32* %bucket, i32* %bucket2, i32* %sum) #0 {
entry:
  call void @local_scan(i32* %bucket)
  call void @sum_scan(i32* %sum, i32* %bucket)
  call void @last_step_scan(i32* %bucket, i32* %bucket2, i32* %sum)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
entry:
  %sum = alloca [524288 x i32], align 16
  %call = call noalias dereferenceable_or_null(33554432) i8* @malloc(i64 33554432) #4
  %0 = bitcast i8* %call to i32*
  %call1 = call noalias dereferenceable_or_null(33554432) i8* @malloc(i64 33554432) #4
  %1 = bitcast i8* %call1 to i32*
  call void @srand(i32 8650341) #4
  br label %for.body

for.body:                                         ; preds = %entry, %for.body
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.body ]
  %call2 = call i32 @rand() #4
  %conv = sitofp i32 %call2 to double
  %div = fdiv double %conv, 0x41DFFFFFFFC00000
  %mul = fmul double %div, 2.048000e+03
  %add = fadd double %mul, 0.000000e+00
  %conv5 = fptosi double %add to i32
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 %indvars.iv
  store i32 %conv5, i32* %arrayidx, align 4
  %call6 = call i32 @rand() #4
  %conv7 = sitofp i32 %call6 to double
  %div8 = fdiv double %conv7, 0x41DFFFFFFFC00000
  %mul11 = fmul double %div8, 2.048000e+03
  %add13 = fadd double %mul11, 0.000000e+00
  %conv14 = fptosi double %add13 to i32
  %arrayidx16 = getelementptr inbounds i32, i32* %1, i64 %indvars.iv
  store i32 %conv14, i32* %arrayidx16, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp ne i64 %indvars.iv.next, 8388608
  br i1 %exitcond, label %for.body, label %for.end

for.end:                                          ; preds = %for.body
  call void @print(i32* %0, i32 1)
  %putchar = call i32 @putchar(i32 10)
  %arraydecay = getelementptr inbounds [524288 x i32], [524288 x i32]* %sum, i64 0, i64 0
  call void @pp_scan(i32* %0, i32* %1, i32* nonnull %arraydecay)
  call void @print(i32* %0, i32 2)
  %putchar2 = call i32 @putchar(i32 10)
  ret i32 0
}

; Function Attrs: nounwind
declare dso_local noalias i8* @malloc(i64) #2

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

; Function Attrs: nofree nounwind
declare i32 @putchar(i32) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nofree nounwind }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.1 "}
!2 = distinct !{!2, !3}
!3 = !{!"llvm.loop.unroll.count", i32 1}
!4 = distinct !{!4, !3}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !3}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.unroll.disable"}
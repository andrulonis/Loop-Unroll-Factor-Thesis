; ModuleID = 'bb_gemm_0_16.ll'
source_filename = "bb_gemm_0_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%u\09\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @bb_gemm(i32* %x, i32* %y, i32* %z) #0 {
entry:
  br label %for.body

for.body:                                         ; preds = %for.inc20.15, %entry
  %indvars.iv11 = phi i64 [ 0, %entry ], [ %indvars.iv.next12.15, %for.inc20.15 ]
  br label %for.body3

for.body3:                                        ; preds = %for.body, %for.inc17
  %indvars.iv6 = phi i64 [ 0, %for.body ], [ %indvars.iv.next7, %for.inc17 ]
  %0 = shl nsw i64 %indvars.iv11, 10
  %1 = add nuw nsw i64 %0, %indvars.iv6
  %arrayidx = getelementptr inbounds i32, i32* %x, i64 %1
  %2 = load i32, i32* %arrayidx, align 4
  br label %for.body6

for.body6:                                        ; preds = %for.body3, %for.body6
  %indvars.iv = phi i64 [ 0, %for.body3 ], [ %indvars.iv.next, %for.body6 ]
  %3 = shl nsw i64 %indvars.iv6, 10
  %4 = add nuw nsw i64 %3, %indvars.iv
  %arrayidx10 = getelementptr inbounds i32, i32* %y, i64 %4
  %5 = load i32, i32* %arrayidx10, align 4
  %mul11 = mul nsw i32 %2, %5
  %6 = shl nsw i64 %indvars.iv11, 10
  %7 = add nuw nsw i64 %6, %indvars.iv
  %arrayidx15 = getelementptr inbounds i32, i32* %z, i64 %7
  %8 = load i32, i32* %arrayidx15, align 4
  %add16 = add nsw i32 %8, %mul11
  store i32 %add16, i32* %arrayidx15, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp ne i64 %indvars.iv.next, 256
  br i1 %exitcond, label %for.body6, label %for.inc17, !llvm.loop !2

for.inc17:                                        ; preds = %for.body6
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond10 = icmp ne i64 %indvars.iv.next7, 256
  br i1 %exitcond10, label %for.body3, label %for.inc20, !llvm.loop !4

for.inc20:                                        ; preds = %for.inc17
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  br label %for.body3.1

for.end22:                                        ; preds = %for.inc20.15
  ret void

for.body3.1:                                      ; preds = %for.inc17.1, %for.inc20
  %indvars.iv6.1 = phi i64 [ 0, %for.inc20 ], [ %indvars.iv.next7.1, %for.inc17.1 ]
  %9 = shl nsw i64 %indvars.iv.next12, 10
  %10 = add nuw nsw i64 %9, %indvars.iv6.1
  %arrayidx.1 = getelementptr inbounds i32, i32* %x, i64 %10
  %11 = load i32, i32* %arrayidx.1, align 4
  br label %for.body6.1

for.body6.1:                                      ; preds = %for.body6.1, %for.body3.1
  %indvars.iv.1 = phi i64 [ 0, %for.body3.1 ], [ %indvars.iv.next.1, %for.body6.1 ]
  %12 = shl nsw i64 %indvars.iv6.1, 10
  %13 = add nuw nsw i64 %12, %indvars.iv.1
  %arrayidx10.1 = getelementptr inbounds i32, i32* %y, i64 %13
  %14 = load i32, i32* %arrayidx10.1, align 4
  %mul11.1 = mul nsw i32 %11, %14
  %15 = shl nsw i64 %indvars.iv.next12, 10
  %16 = add nuw nsw i64 %15, %indvars.iv.1
  %arrayidx15.1 = getelementptr inbounds i32, i32* %z, i64 %16
  %17 = load i32, i32* %arrayidx15.1, align 4
  %add16.1 = add nsw i32 %17, %mul11.1
  store i32 %add16.1, i32* %arrayidx15.1, align 4
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv.1, 1
  %exitcond.1 = icmp ne i64 %indvars.iv.next.1, 256
  br i1 %exitcond.1, label %for.body6.1, label %for.inc17.1, !llvm.loop !2

for.inc17.1:                                      ; preds = %for.body6.1
  %indvars.iv.next7.1 = add nuw nsw i64 %indvars.iv6.1, 1
  %exitcond10.1 = icmp ne i64 %indvars.iv.next7.1, 256
  br i1 %exitcond10.1, label %for.body3.1, label %for.inc20.1, !llvm.loop !4

for.inc20.1:                                      ; preds = %for.inc17.1
  %indvars.iv.next12.1 = add nuw nsw i64 %indvars.iv.next12, 1
  br label %for.body3.2

for.body3.2:                                      ; preds = %for.inc17.2, %for.inc20.1
  %indvars.iv6.2 = phi i64 [ 0, %for.inc20.1 ], [ %indvars.iv.next7.2, %for.inc17.2 ]
  %18 = shl nsw i64 %indvars.iv.next12.1, 10
  %19 = add nuw nsw i64 %18, %indvars.iv6.2
  %arrayidx.2 = getelementptr inbounds i32, i32* %x, i64 %19
  %20 = load i32, i32* %arrayidx.2, align 4
  br label %for.body6.2

for.body6.2:                                      ; preds = %for.body6.2, %for.body3.2
  %indvars.iv.2 = phi i64 [ 0, %for.body3.2 ], [ %indvars.iv.next.2, %for.body6.2 ]
  %21 = shl nsw i64 %indvars.iv6.2, 10
  %22 = add nuw nsw i64 %21, %indvars.iv.2
  %arrayidx10.2 = getelementptr inbounds i32, i32* %y, i64 %22
  %23 = load i32, i32* %arrayidx10.2, align 4
  %mul11.2 = mul nsw i32 %20, %23
  %24 = shl nsw i64 %indvars.iv.next12.1, 10
  %25 = add nuw nsw i64 %24, %indvars.iv.2
  %arrayidx15.2 = getelementptr inbounds i32, i32* %z, i64 %25
  %26 = load i32, i32* %arrayidx15.2, align 4
  %add16.2 = add nsw i32 %26, %mul11.2
  store i32 %add16.2, i32* %arrayidx15.2, align 4
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv.2, 1
  %exitcond.2 = icmp ne i64 %indvars.iv.next.2, 256
  br i1 %exitcond.2, label %for.body6.2, label %for.inc17.2, !llvm.loop !2

for.inc17.2:                                      ; preds = %for.body6.2
  %indvars.iv.next7.2 = add nuw nsw i64 %indvars.iv6.2, 1
  %exitcond10.2 = icmp ne i64 %indvars.iv.next7.2, 256
  br i1 %exitcond10.2, label %for.body3.2, label %for.inc20.2, !llvm.loop !4

for.inc20.2:                                      ; preds = %for.inc17.2
  %indvars.iv.next12.2 = add nuw nsw i64 %indvars.iv.next12.1, 1
  br label %for.body3.3

for.body3.3:                                      ; preds = %for.inc17.3, %for.inc20.2
  %indvars.iv6.3 = phi i64 [ 0, %for.inc20.2 ], [ %indvars.iv.next7.3, %for.inc17.3 ]
  %27 = shl nsw i64 %indvars.iv.next12.2, 10
  %28 = add nuw nsw i64 %27, %indvars.iv6.3
  %arrayidx.3 = getelementptr inbounds i32, i32* %x, i64 %28
  %29 = load i32, i32* %arrayidx.3, align 4
  br label %for.body6.3

for.body6.3:                                      ; preds = %for.body6.3, %for.body3.3
  %indvars.iv.3 = phi i64 [ 0, %for.body3.3 ], [ %indvars.iv.next.3, %for.body6.3 ]
  %30 = shl nsw i64 %indvars.iv6.3, 10
  %31 = add nuw nsw i64 %30, %indvars.iv.3
  %arrayidx10.3 = getelementptr inbounds i32, i32* %y, i64 %31
  %32 = load i32, i32* %arrayidx10.3, align 4
  %mul11.3 = mul nsw i32 %29, %32
  %33 = shl nsw i64 %indvars.iv.next12.2, 10
  %34 = add nuw nsw i64 %33, %indvars.iv.3
  %arrayidx15.3 = getelementptr inbounds i32, i32* %z, i64 %34
  %35 = load i32, i32* %arrayidx15.3, align 4
  %add16.3 = add nsw i32 %35, %mul11.3
  store i32 %add16.3, i32* %arrayidx15.3, align 4
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv.3, 1
  %exitcond.3 = icmp ne i64 %indvars.iv.next.3, 256
  br i1 %exitcond.3, label %for.body6.3, label %for.inc17.3, !llvm.loop !2

for.inc17.3:                                      ; preds = %for.body6.3
  %indvars.iv.next7.3 = add nuw nsw i64 %indvars.iv6.3, 1
  %exitcond10.3 = icmp ne i64 %indvars.iv.next7.3, 256
  br i1 %exitcond10.3, label %for.body3.3, label %for.inc20.3, !llvm.loop !4

for.inc20.3:                                      ; preds = %for.inc17.3
  %indvars.iv.next12.3 = add nuw nsw i64 %indvars.iv.next12.2, 1
  br label %for.body3.4

for.body3.4:                                      ; preds = %for.inc17.4, %for.inc20.3
  %indvars.iv6.4 = phi i64 [ 0, %for.inc20.3 ], [ %indvars.iv.next7.4, %for.inc17.4 ]
  %36 = shl nsw i64 %indvars.iv.next12.3, 10
  %37 = add nuw nsw i64 %36, %indvars.iv6.4
  %arrayidx.4 = getelementptr inbounds i32, i32* %x, i64 %37
  %38 = load i32, i32* %arrayidx.4, align 4
  br label %for.body6.4

for.body6.4:                                      ; preds = %for.body6.4, %for.body3.4
  %indvars.iv.4 = phi i64 [ 0, %for.body3.4 ], [ %indvars.iv.next.4, %for.body6.4 ]
  %39 = shl nsw i64 %indvars.iv6.4, 10
  %40 = add nuw nsw i64 %39, %indvars.iv.4
  %arrayidx10.4 = getelementptr inbounds i32, i32* %y, i64 %40
  %41 = load i32, i32* %arrayidx10.4, align 4
  %mul11.4 = mul nsw i32 %38, %41
  %42 = shl nsw i64 %indvars.iv.next12.3, 10
  %43 = add nuw nsw i64 %42, %indvars.iv.4
  %arrayidx15.4 = getelementptr inbounds i32, i32* %z, i64 %43
  %44 = load i32, i32* %arrayidx15.4, align 4
  %add16.4 = add nsw i32 %44, %mul11.4
  store i32 %add16.4, i32* %arrayidx15.4, align 4
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv.4, 1
  %exitcond.4 = icmp ne i64 %indvars.iv.next.4, 256
  br i1 %exitcond.4, label %for.body6.4, label %for.inc17.4, !llvm.loop !2

for.inc17.4:                                      ; preds = %for.body6.4
  %indvars.iv.next7.4 = add nuw nsw i64 %indvars.iv6.4, 1
  %exitcond10.4 = icmp ne i64 %indvars.iv.next7.4, 256
  br i1 %exitcond10.4, label %for.body3.4, label %for.inc20.4, !llvm.loop !4

for.inc20.4:                                      ; preds = %for.inc17.4
  %indvars.iv.next12.4 = add nuw nsw i64 %indvars.iv.next12.3, 1
  br label %for.body3.5

for.body3.5:                                      ; preds = %for.inc17.5, %for.inc20.4
  %indvars.iv6.5 = phi i64 [ 0, %for.inc20.4 ], [ %indvars.iv.next7.5, %for.inc17.5 ]
  %45 = shl nsw i64 %indvars.iv.next12.4, 10
  %46 = add nuw nsw i64 %45, %indvars.iv6.5
  %arrayidx.5 = getelementptr inbounds i32, i32* %x, i64 %46
  %47 = load i32, i32* %arrayidx.5, align 4
  br label %for.body6.5

for.body6.5:                                      ; preds = %for.body6.5, %for.body3.5
  %indvars.iv.5 = phi i64 [ 0, %for.body3.5 ], [ %indvars.iv.next.5, %for.body6.5 ]
  %48 = shl nsw i64 %indvars.iv6.5, 10
  %49 = add nuw nsw i64 %48, %indvars.iv.5
  %arrayidx10.5 = getelementptr inbounds i32, i32* %y, i64 %49
  %50 = load i32, i32* %arrayidx10.5, align 4
  %mul11.5 = mul nsw i32 %47, %50
  %51 = shl nsw i64 %indvars.iv.next12.4, 10
  %52 = add nuw nsw i64 %51, %indvars.iv.5
  %arrayidx15.5 = getelementptr inbounds i32, i32* %z, i64 %52
  %53 = load i32, i32* %arrayidx15.5, align 4
  %add16.5 = add nsw i32 %53, %mul11.5
  store i32 %add16.5, i32* %arrayidx15.5, align 4
  %indvars.iv.next.5 = add nuw nsw i64 %indvars.iv.5, 1
  %exitcond.5 = icmp ne i64 %indvars.iv.next.5, 256
  br i1 %exitcond.5, label %for.body6.5, label %for.inc17.5, !llvm.loop !2

for.inc17.5:                                      ; preds = %for.body6.5
  %indvars.iv.next7.5 = add nuw nsw i64 %indvars.iv6.5, 1
  %exitcond10.5 = icmp ne i64 %indvars.iv.next7.5, 256
  br i1 %exitcond10.5, label %for.body3.5, label %for.inc20.5, !llvm.loop !4

for.inc20.5:                                      ; preds = %for.inc17.5
  %indvars.iv.next12.5 = add nuw nsw i64 %indvars.iv.next12.4, 1
  br label %for.body3.6

for.body3.6:                                      ; preds = %for.inc17.6, %for.inc20.5
  %indvars.iv6.6 = phi i64 [ 0, %for.inc20.5 ], [ %indvars.iv.next7.6, %for.inc17.6 ]
  %54 = shl nsw i64 %indvars.iv.next12.5, 10
  %55 = add nuw nsw i64 %54, %indvars.iv6.6
  %arrayidx.6 = getelementptr inbounds i32, i32* %x, i64 %55
  %56 = load i32, i32* %arrayidx.6, align 4
  br label %for.body6.6

for.body6.6:                                      ; preds = %for.body6.6, %for.body3.6
  %indvars.iv.6 = phi i64 [ 0, %for.body3.6 ], [ %indvars.iv.next.6, %for.body6.6 ]
  %57 = shl nsw i64 %indvars.iv6.6, 10
  %58 = add nuw nsw i64 %57, %indvars.iv.6
  %arrayidx10.6 = getelementptr inbounds i32, i32* %y, i64 %58
  %59 = load i32, i32* %arrayidx10.6, align 4
  %mul11.6 = mul nsw i32 %56, %59
  %60 = shl nsw i64 %indvars.iv.next12.5, 10
  %61 = add nuw nsw i64 %60, %indvars.iv.6
  %arrayidx15.6 = getelementptr inbounds i32, i32* %z, i64 %61
  %62 = load i32, i32* %arrayidx15.6, align 4
  %add16.6 = add nsw i32 %62, %mul11.6
  store i32 %add16.6, i32* %arrayidx15.6, align 4
  %indvars.iv.next.6 = add nuw nsw i64 %indvars.iv.6, 1
  %exitcond.6 = icmp ne i64 %indvars.iv.next.6, 256
  br i1 %exitcond.6, label %for.body6.6, label %for.inc17.6, !llvm.loop !2

for.inc17.6:                                      ; preds = %for.body6.6
  %indvars.iv.next7.6 = add nuw nsw i64 %indvars.iv6.6, 1
  %exitcond10.6 = icmp ne i64 %indvars.iv.next7.6, 256
  br i1 %exitcond10.6, label %for.body3.6, label %for.inc20.6, !llvm.loop !4

for.inc20.6:                                      ; preds = %for.inc17.6
  %indvars.iv.next12.6 = add nuw nsw i64 %indvars.iv.next12.5, 1
  br label %for.body3.7

for.body3.7:                                      ; preds = %for.inc17.7, %for.inc20.6
  %indvars.iv6.7 = phi i64 [ 0, %for.inc20.6 ], [ %indvars.iv.next7.7, %for.inc17.7 ]
  %63 = shl nsw i64 %indvars.iv.next12.6, 10
  %64 = add nuw nsw i64 %63, %indvars.iv6.7
  %arrayidx.7 = getelementptr inbounds i32, i32* %x, i64 %64
  %65 = load i32, i32* %arrayidx.7, align 4
  br label %for.body6.7

for.body6.7:                                      ; preds = %for.body6.7, %for.body3.7
  %indvars.iv.7 = phi i64 [ 0, %for.body3.7 ], [ %indvars.iv.next.7, %for.body6.7 ]
  %66 = shl nsw i64 %indvars.iv6.7, 10
  %67 = add nuw nsw i64 %66, %indvars.iv.7
  %arrayidx10.7 = getelementptr inbounds i32, i32* %y, i64 %67
  %68 = load i32, i32* %arrayidx10.7, align 4
  %mul11.7 = mul nsw i32 %65, %68
  %69 = shl nsw i64 %indvars.iv.next12.6, 10
  %70 = add nuw nsw i64 %69, %indvars.iv.7
  %arrayidx15.7 = getelementptr inbounds i32, i32* %z, i64 %70
  %71 = load i32, i32* %arrayidx15.7, align 4
  %add16.7 = add nsw i32 %71, %mul11.7
  store i32 %add16.7, i32* %arrayidx15.7, align 4
  %indvars.iv.next.7 = add nuw nsw i64 %indvars.iv.7, 1
  %exitcond.7 = icmp ne i64 %indvars.iv.next.7, 256
  br i1 %exitcond.7, label %for.body6.7, label %for.inc17.7, !llvm.loop !2

for.inc17.7:                                      ; preds = %for.body6.7
  %indvars.iv.next7.7 = add nuw nsw i64 %indvars.iv6.7, 1
  %exitcond10.7 = icmp ne i64 %indvars.iv.next7.7, 256
  br i1 %exitcond10.7, label %for.body3.7, label %for.inc20.7, !llvm.loop !4

for.inc20.7:                                      ; preds = %for.inc17.7
  %indvars.iv.next12.7 = add nuw nsw i64 %indvars.iv.next12.6, 1
  br label %for.body3.8

for.body3.8:                                      ; preds = %for.inc17.8, %for.inc20.7
  %indvars.iv6.8 = phi i64 [ 0, %for.inc20.7 ], [ %indvars.iv.next7.8, %for.inc17.8 ]
  %72 = shl nsw i64 %indvars.iv.next12.7, 10
  %73 = add nuw nsw i64 %72, %indvars.iv6.8
  %arrayidx.8 = getelementptr inbounds i32, i32* %x, i64 %73
  %74 = load i32, i32* %arrayidx.8, align 4
  br label %for.body6.8

for.body6.8:                                      ; preds = %for.body6.8, %for.body3.8
  %indvars.iv.8 = phi i64 [ 0, %for.body3.8 ], [ %indvars.iv.next.8, %for.body6.8 ]
  %75 = shl nsw i64 %indvars.iv6.8, 10
  %76 = add nuw nsw i64 %75, %indvars.iv.8
  %arrayidx10.8 = getelementptr inbounds i32, i32* %y, i64 %76
  %77 = load i32, i32* %arrayidx10.8, align 4
  %mul11.8 = mul nsw i32 %74, %77
  %78 = shl nsw i64 %indvars.iv.next12.7, 10
  %79 = add nuw nsw i64 %78, %indvars.iv.8
  %arrayidx15.8 = getelementptr inbounds i32, i32* %z, i64 %79
  %80 = load i32, i32* %arrayidx15.8, align 4
  %add16.8 = add nsw i32 %80, %mul11.8
  store i32 %add16.8, i32* %arrayidx15.8, align 4
  %indvars.iv.next.8 = add nuw nsw i64 %indvars.iv.8, 1
  %exitcond.8 = icmp ne i64 %indvars.iv.next.8, 256
  br i1 %exitcond.8, label %for.body6.8, label %for.inc17.8, !llvm.loop !2

for.inc17.8:                                      ; preds = %for.body6.8
  %indvars.iv.next7.8 = add nuw nsw i64 %indvars.iv6.8, 1
  %exitcond10.8 = icmp ne i64 %indvars.iv.next7.8, 256
  br i1 %exitcond10.8, label %for.body3.8, label %for.inc20.8, !llvm.loop !4

for.inc20.8:                                      ; preds = %for.inc17.8
  %indvars.iv.next12.8 = add nuw nsw i64 %indvars.iv.next12.7, 1
  br label %for.body3.9

for.body3.9:                                      ; preds = %for.inc17.9, %for.inc20.8
  %indvars.iv6.9 = phi i64 [ 0, %for.inc20.8 ], [ %indvars.iv.next7.9, %for.inc17.9 ]
  %81 = shl nsw i64 %indvars.iv.next12.8, 10
  %82 = add nuw nsw i64 %81, %indvars.iv6.9
  %arrayidx.9 = getelementptr inbounds i32, i32* %x, i64 %82
  %83 = load i32, i32* %arrayidx.9, align 4
  br label %for.body6.9

for.body6.9:                                      ; preds = %for.body6.9, %for.body3.9
  %indvars.iv.9 = phi i64 [ 0, %for.body3.9 ], [ %indvars.iv.next.9, %for.body6.9 ]
  %84 = shl nsw i64 %indvars.iv6.9, 10
  %85 = add nuw nsw i64 %84, %indvars.iv.9
  %arrayidx10.9 = getelementptr inbounds i32, i32* %y, i64 %85
  %86 = load i32, i32* %arrayidx10.9, align 4
  %mul11.9 = mul nsw i32 %83, %86
  %87 = shl nsw i64 %indvars.iv.next12.8, 10
  %88 = add nuw nsw i64 %87, %indvars.iv.9
  %arrayidx15.9 = getelementptr inbounds i32, i32* %z, i64 %88
  %89 = load i32, i32* %arrayidx15.9, align 4
  %add16.9 = add nsw i32 %89, %mul11.9
  store i32 %add16.9, i32* %arrayidx15.9, align 4
  %indvars.iv.next.9 = add nuw nsw i64 %indvars.iv.9, 1
  %exitcond.9 = icmp ne i64 %indvars.iv.next.9, 256
  br i1 %exitcond.9, label %for.body6.9, label %for.inc17.9, !llvm.loop !2

for.inc17.9:                                      ; preds = %for.body6.9
  %indvars.iv.next7.9 = add nuw nsw i64 %indvars.iv6.9, 1
  %exitcond10.9 = icmp ne i64 %indvars.iv.next7.9, 256
  br i1 %exitcond10.9, label %for.body3.9, label %for.inc20.9, !llvm.loop !4

for.inc20.9:                                      ; preds = %for.inc17.9
  %indvars.iv.next12.9 = add nuw nsw i64 %indvars.iv.next12.8, 1
  br label %for.body3.10

for.body3.10:                                     ; preds = %for.inc17.10, %for.inc20.9
  %indvars.iv6.10 = phi i64 [ 0, %for.inc20.9 ], [ %indvars.iv.next7.10, %for.inc17.10 ]
  %90 = shl nsw i64 %indvars.iv.next12.9, 10
  %91 = add nuw nsw i64 %90, %indvars.iv6.10
  %arrayidx.10 = getelementptr inbounds i32, i32* %x, i64 %91
  %92 = load i32, i32* %arrayidx.10, align 4
  br label %for.body6.10

for.body6.10:                                     ; preds = %for.body6.10, %for.body3.10
  %indvars.iv.10 = phi i64 [ 0, %for.body3.10 ], [ %indvars.iv.next.10, %for.body6.10 ]
  %93 = shl nsw i64 %indvars.iv6.10, 10
  %94 = add nuw nsw i64 %93, %indvars.iv.10
  %arrayidx10.10 = getelementptr inbounds i32, i32* %y, i64 %94
  %95 = load i32, i32* %arrayidx10.10, align 4
  %mul11.10 = mul nsw i32 %92, %95
  %96 = shl nsw i64 %indvars.iv.next12.9, 10
  %97 = add nuw nsw i64 %96, %indvars.iv.10
  %arrayidx15.10 = getelementptr inbounds i32, i32* %z, i64 %97
  %98 = load i32, i32* %arrayidx15.10, align 4
  %add16.10 = add nsw i32 %98, %mul11.10
  store i32 %add16.10, i32* %arrayidx15.10, align 4
  %indvars.iv.next.10 = add nuw nsw i64 %indvars.iv.10, 1
  %exitcond.10 = icmp ne i64 %indvars.iv.next.10, 256
  br i1 %exitcond.10, label %for.body6.10, label %for.inc17.10, !llvm.loop !2

for.inc17.10:                                     ; preds = %for.body6.10
  %indvars.iv.next7.10 = add nuw nsw i64 %indvars.iv6.10, 1
  %exitcond10.10 = icmp ne i64 %indvars.iv.next7.10, 256
  br i1 %exitcond10.10, label %for.body3.10, label %for.inc20.10, !llvm.loop !4

for.inc20.10:                                     ; preds = %for.inc17.10
  %indvars.iv.next12.10 = add nuw nsw i64 %indvars.iv.next12.9, 1
  br label %for.body3.11

for.body3.11:                                     ; preds = %for.inc17.11, %for.inc20.10
  %indvars.iv6.11 = phi i64 [ 0, %for.inc20.10 ], [ %indvars.iv.next7.11, %for.inc17.11 ]
  %99 = shl nsw i64 %indvars.iv.next12.10, 10
  %100 = add nuw nsw i64 %99, %indvars.iv6.11
  %arrayidx.11 = getelementptr inbounds i32, i32* %x, i64 %100
  %101 = load i32, i32* %arrayidx.11, align 4
  br label %for.body6.11

for.body6.11:                                     ; preds = %for.body6.11, %for.body3.11
  %indvars.iv.11 = phi i64 [ 0, %for.body3.11 ], [ %indvars.iv.next.11, %for.body6.11 ]
  %102 = shl nsw i64 %indvars.iv6.11, 10
  %103 = add nuw nsw i64 %102, %indvars.iv.11
  %arrayidx10.11 = getelementptr inbounds i32, i32* %y, i64 %103
  %104 = load i32, i32* %arrayidx10.11, align 4
  %mul11.11 = mul nsw i32 %101, %104
  %105 = shl nsw i64 %indvars.iv.next12.10, 10
  %106 = add nuw nsw i64 %105, %indvars.iv.11
  %arrayidx15.11 = getelementptr inbounds i32, i32* %z, i64 %106
  %107 = load i32, i32* %arrayidx15.11, align 4
  %add16.11 = add nsw i32 %107, %mul11.11
  store i32 %add16.11, i32* %arrayidx15.11, align 4
  %indvars.iv.next.11 = add nuw nsw i64 %indvars.iv.11, 1
  %exitcond.11 = icmp ne i64 %indvars.iv.next.11, 256
  br i1 %exitcond.11, label %for.body6.11, label %for.inc17.11, !llvm.loop !2

for.inc17.11:                                     ; preds = %for.body6.11
  %indvars.iv.next7.11 = add nuw nsw i64 %indvars.iv6.11, 1
  %exitcond10.11 = icmp ne i64 %indvars.iv.next7.11, 256
  br i1 %exitcond10.11, label %for.body3.11, label %for.inc20.11, !llvm.loop !4

for.inc20.11:                                     ; preds = %for.inc17.11
  %indvars.iv.next12.11 = add nuw nsw i64 %indvars.iv.next12.10, 1
  br label %for.body3.12

for.body3.12:                                     ; preds = %for.inc17.12, %for.inc20.11
  %indvars.iv6.12 = phi i64 [ 0, %for.inc20.11 ], [ %indvars.iv.next7.12, %for.inc17.12 ]
  %108 = shl nsw i64 %indvars.iv.next12.11, 10
  %109 = add nuw nsw i64 %108, %indvars.iv6.12
  %arrayidx.12 = getelementptr inbounds i32, i32* %x, i64 %109
  %110 = load i32, i32* %arrayidx.12, align 4
  br label %for.body6.12

for.body6.12:                                     ; preds = %for.body6.12, %for.body3.12
  %indvars.iv.12 = phi i64 [ 0, %for.body3.12 ], [ %indvars.iv.next.12, %for.body6.12 ]
  %111 = shl nsw i64 %indvars.iv6.12, 10
  %112 = add nuw nsw i64 %111, %indvars.iv.12
  %arrayidx10.12 = getelementptr inbounds i32, i32* %y, i64 %112
  %113 = load i32, i32* %arrayidx10.12, align 4
  %mul11.12 = mul nsw i32 %110, %113
  %114 = shl nsw i64 %indvars.iv.next12.11, 10
  %115 = add nuw nsw i64 %114, %indvars.iv.12
  %arrayidx15.12 = getelementptr inbounds i32, i32* %z, i64 %115
  %116 = load i32, i32* %arrayidx15.12, align 4
  %add16.12 = add nsw i32 %116, %mul11.12
  store i32 %add16.12, i32* %arrayidx15.12, align 4
  %indvars.iv.next.12 = add nuw nsw i64 %indvars.iv.12, 1
  %exitcond.12 = icmp ne i64 %indvars.iv.next.12, 256
  br i1 %exitcond.12, label %for.body6.12, label %for.inc17.12, !llvm.loop !2

for.inc17.12:                                     ; preds = %for.body6.12
  %indvars.iv.next7.12 = add nuw nsw i64 %indvars.iv6.12, 1
  %exitcond10.12 = icmp ne i64 %indvars.iv.next7.12, 256
  br i1 %exitcond10.12, label %for.body3.12, label %for.inc20.12, !llvm.loop !4

for.inc20.12:                                     ; preds = %for.inc17.12
  %indvars.iv.next12.12 = add nuw nsw i64 %indvars.iv.next12.11, 1
  br label %for.body3.13

for.body3.13:                                     ; preds = %for.inc17.13, %for.inc20.12
  %indvars.iv6.13 = phi i64 [ 0, %for.inc20.12 ], [ %indvars.iv.next7.13, %for.inc17.13 ]
  %117 = shl nsw i64 %indvars.iv.next12.12, 10
  %118 = add nuw nsw i64 %117, %indvars.iv6.13
  %arrayidx.13 = getelementptr inbounds i32, i32* %x, i64 %118
  %119 = load i32, i32* %arrayidx.13, align 4
  br label %for.body6.13

for.body6.13:                                     ; preds = %for.body6.13, %for.body3.13
  %indvars.iv.13 = phi i64 [ 0, %for.body3.13 ], [ %indvars.iv.next.13, %for.body6.13 ]
  %120 = shl nsw i64 %indvars.iv6.13, 10
  %121 = add nuw nsw i64 %120, %indvars.iv.13
  %arrayidx10.13 = getelementptr inbounds i32, i32* %y, i64 %121
  %122 = load i32, i32* %arrayidx10.13, align 4
  %mul11.13 = mul nsw i32 %119, %122
  %123 = shl nsw i64 %indvars.iv.next12.12, 10
  %124 = add nuw nsw i64 %123, %indvars.iv.13
  %arrayidx15.13 = getelementptr inbounds i32, i32* %z, i64 %124
  %125 = load i32, i32* %arrayidx15.13, align 4
  %add16.13 = add nsw i32 %125, %mul11.13
  store i32 %add16.13, i32* %arrayidx15.13, align 4
  %indvars.iv.next.13 = add nuw nsw i64 %indvars.iv.13, 1
  %exitcond.13 = icmp ne i64 %indvars.iv.next.13, 256
  br i1 %exitcond.13, label %for.body6.13, label %for.inc17.13, !llvm.loop !2

for.inc17.13:                                     ; preds = %for.body6.13
  %indvars.iv.next7.13 = add nuw nsw i64 %indvars.iv6.13, 1
  %exitcond10.13 = icmp ne i64 %indvars.iv.next7.13, 256
  br i1 %exitcond10.13, label %for.body3.13, label %for.inc20.13, !llvm.loop !4

for.inc20.13:                                     ; preds = %for.inc17.13
  %indvars.iv.next12.13 = add nuw nsw i64 %indvars.iv.next12.12, 1
  br label %for.body3.14

for.body3.14:                                     ; preds = %for.inc17.14, %for.inc20.13
  %indvars.iv6.14 = phi i64 [ 0, %for.inc20.13 ], [ %indvars.iv.next7.14, %for.inc17.14 ]
  %126 = shl nsw i64 %indvars.iv.next12.13, 10
  %127 = add nuw nsw i64 %126, %indvars.iv6.14
  %arrayidx.14 = getelementptr inbounds i32, i32* %x, i64 %127
  %128 = load i32, i32* %arrayidx.14, align 4
  br label %for.body6.14

for.body6.14:                                     ; preds = %for.body6.14, %for.body3.14
  %indvars.iv.14 = phi i64 [ 0, %for.body3.14 ], [ %indvars.iv.next.14, %for.body6.14 ]
  %129 = shl nsw i64 %indvars.iv6.14, 10
  %130 = add nuw nsw i64 %129, %indvars.iv.14
  %arrayidx10.14 = getelementptr inbounds i32, i32* %y, i64 %130
  %131 = load i32, i32* %arrayidx10.14, align 4
  %mul11.14 = mul nsw i32 %128, %131
  %132 = shl nsw i64 %indvars.iv.next12.13, 10
  %133 = add nuw nsw i64 %132, %indvars.iv.14
  %arrayidx15.14 = getelementptr inbounds i32, i32* %z, i64 %133
  %134 = load i32, i32* %arrayidx15.14, align 4
  %add16.14 = add nsw i32 %134, %mul11.14
  store i32 %add16.14, i32* %arrayidx15.14, align 4
  %indvars.iv.next.14 = add nuw nsw i64 %indvars.iv.14, 1
  %exitcond.14 = icmp ne i64 %indvars.iv.next.14, 256
  br i1 %exitcond.14, label %for.body6.14, label %for.inc17.14, !llvm.loop !2

for.inc17.14:                                     ; preds = %for.body6.14
  %indvars.iv.next7.14 = add nuw nsw i64 %indvars.iv6.14, 1
  %exitcond10.14 = icmp ne i64 %indvars.iv.next7.14, 256
  br i1 %exitcond10.14, label %for.body3.14, label %for.inc20.14, !llvm.loop !4

for.inc20.14:                                     ; preds = %for.inc17.14
  %indvars.iv.next12.14 = add nuw nsw i64 %indvars.iv.next12.13, 1
  br label %for.body3.15

for.body3.15:                                     ; preds = %for.inc17.15, %for.inc20.14
  %indvars.iv6.15 = phi i64 [ 0, %for.inc20.14 ], [ %indvars.iv.next7.15, %for.inc17.15 ]
  %135 = shl nsw i64 %indvars.iv.next12.14, 10
  %136 = add nuw nsw i64 %135, %indvars.iv6.15
  %arrayidx.15 = getelementptr inbounds i32, i32* %x, i64 %136
  %137 = load i32, i32* %arrayidx.15, align 4
  br label %for.body6.15

for.body6.15:                                     ; preds = %for.body6.15, %for.body3.15
  %indvars.iv.15 = phi i64 [ 0, %for.body3.15 ], [ %indvars.iv.next.15, %for.body6.15 ]
  %138 = shl nsw i64 %indvars.iv6.15, 10
  %139 = add nuw nsw i64 %138, %indvars.iv.15
  %arrayidx10.15 = getelementptr inbounds i32, i32* %y, i64 %139
  %140 = load i32, i32* %arrayidx10.15, align 4
  %mul11.15 = mul nsw i32 %137, %140
  %141 = shl nsw i64 %indvars.iv.next12.14, 10
  %142 = add nuw nsw i64 %141, %indvars.iv.15
  %arrayidx15.15 = getelementptr inbounds i32, i32* %z, i64 %142
  %143 = load i32, i32* %arrayidx15.15, align 4
  %add16.15 = add nsw i32 %143, %mul11.15
  store i32 %add16.15, i32* %arrayidx15.15, align 4
  %indvars.iv.next.15 = add nuw nsw i64 %indvars.iv.15, 1
  %exitcond.15 = icmp ne i64 %indvars.iv.next.15, 256
  br i1 %exitcond.15, label %for.body6.15, label %for.inc17.15, !llvm.loop !2

for.inc17.15:                                     ; preds = %for.body6.15
  %indvars.iv.next7.15 = add nuw nsw i64 %indvars.iv6.15, 1
  %exitcond10.15 = icmp ne i64 %indvars.iv.next7.15, 256
  br i1 %exitcond10.15, label %for.body3.15, label %for.inc20.15, !llvm.loop !4

for.inc20.15:                                     ; preds = %for.inc17.15
  %indvars.iv.next12.15 = add nuw nsw i64 %indvars.iv.next12.14, 1
  %exitcond15.15 = icmp ne i64 %indvars.iv.next12.15, 1024
  br i1 %exitcond15.15, label %for.body, label %for.end22, !llvm.loop !5
}

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
define dso_local i32 @main() #0 {
entry:
  %call = call noalias dereferenceable_or_null(4194304) i8* @malloc(i64 4194304) #4
  %0 = bitcast i8* %call to i32*
  %call1 = call noalias dereferenceable_or_null(4194304) i8* @malloc(i64 4194304) #4
  %1 = bitcast i8* %call1 to i32*
  %call2 = call noalias dereferenceable_or_null(4194304) i8* @malloc(i64 4194304) #4
  %2 = bitcast i8* %call2 to i32*
  call void @srand(i32 8650341) #4
  br label %for.body

for.body:                                         ; preds = %entry, %for.body
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.body ]
  %call3 = call i32 @rand() #4
  %conv = sitofp i32 %call3 to double
  %div = fdiv double %conv, 0x41DFFFFFFFC00000
  %mul = fmul double %div, 1.280000e+02
  %add = fadd double %mul, 0.000000e+00
  %conv6 = fptosi double %add to i32
  %arrayidx = getelementptr inbounds i32, i32* %0, i64 %indvars.iv
  store i32 %conv6, i32* %arrayidx, align 4
  %call7 = call i32 @rand() #4
  %conv8 = sitofp i32 %call7 to double
  %div9 = fdiv double %conv8, 0x41DFFFFFFFC00000
  %mul12 = fmul double %div9, 1.280000e+02
  %add14 = fadd double %mul12, 0.000000e+00
  %conv15 = fptosi double %add14 to i32
  %arrayidx17 = getelementptr inbounds i32, i32* %1, i64 %indvars.iv
  store i32 %conv15, i32* %arrayidx17, align 4
  %arrayidx19 = getelementptr inbounds i32, i32* %2, i64 %indvars.iv
  store i32 0, i32* %arrayidx19, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp ne i64 %indvars.iv.next, 1048576
  br i1 %exitcond, label %for.body, label %for.end

for.end:                                          ; preds = %for.body
  call void @bb_gemm(i32* %0, i32* %1, i32* %2)
  call void @print(i32* %2, i32 1048576)
  %putchar = call i32 @putchar(i32 10)
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
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.unroll.disable"}
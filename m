Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B7867BABCA
	for <lists+linux-doc@lfdr.de>; Thu,  5 Oct 2023 23:07:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231876AbjJEVGm (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 5 Oct 2023 17:06:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231948AbjJEVGi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 5 Oct 2023 17:06:38 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C36D0FA;
        Thu,  5 Oct 2023 14:06:34 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32E1BC433C9;
        Thu,  5 Oct 2023 21:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696539993;
        bh=nJDLT1TLu7k+3W/mJBdiP5fMzpCb0i21tjNuXJX5EVk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uo6uaorc6En2tbarjjGJdbDPvq215l/xrgbaFU5MuwUad/3pMvIyVdEKvmeS3vgbg
         nLzoiQKzChkux2s05TPLxa8X4WNfN9FeicPjUcRT5COEyTGcIhsiDf6fdpadBdAjT3
         t+2n4563wDnuVNVeTy1mpxyi0YV7L8P5LCFAgMvRB0FI02e14aefLe1OddyoUWl7oh
         J8xJV7U0RuszS3EU25JB1WGGISKkYO4k12Th800tiv3TWohQJDiZY49cDRQHuz4TPX
         5V9XL0CGEGh0/vRCnMKMvU/qwkBNsruJwWoRzaYUt2ni2g5R+jKfVNQ1gNWDuz4sLn
         /WoVm3/2GS20A==
From:   Miguel Ojeda <ojeda@kernel.org>
To:     Miguel Ojeda <ojeda@kernel.org>,
        Wedson Almeida Filho <wedsonaf@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>
Cc:     Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
        Benno Lossin <benno.lossin@proton.me>,
        Andreas Hindborg <a.hindborg@samsung.com>,
        Alice Ryhl <aliceryhl@google.com>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH 3/3] rust: upgrade to Rust 1.73.0
Date:   Thu,  5 Oct 2023 23:05:55 +0200
Message-ID: <20231005210556.466856-4-ojeda@kernel.org>
In-Reply-To: <20231005210556.466856-1-ojeda@kernel.org>
References: <20231005210556.466856-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This is the next upgrade to the Rust toolchain, from 1.72.1 to 1.73.0
(i.e. the latest) [1].

See the upgrade policy [2] and the comments on the first upgrade in
commit 3ed03f4da06e ("rust: upgrade to Rust 1.68.2").

# Unstable features

No unstable features (that we use) were stabilized.

Therefore, the only unstable feature allowed to be used outside
the `kernel` crate is still `new_uninit`, though other code to be
upstreamed may increase the list.

Please see [3] for details.

# Required changes

For the upgrade, the following changes are required:

  - Allow `internal_features` for `feature(compiler_builtins)` since
    now Rust warns about using internal compiler and standard library
    features (similar to how it also warns about incomplete ones) [4].

  - A cleanup for a documentation link thanks to a new `rustdoc` lint.
    See previous commits for details.

  - A need to make an intra-doc link to a macro explicit, due to a
    change in behavior in `rustdoc`. See previous commits for details.

# `alloc` upgrade and reviewing

The vast majority of changes are due to our `alloc` fork being upgraded
at once.

There are two kinds of changes to be aware of: the ones coming from
upstream, which we should follow as closely as possible, and the updates
needed in our added fallible APIs to keep them matching the newer
infallible APIs coming from upstream.

Instead of taking a look at the diff of this patch, an alternative
approach is reviewing a diff of the changes between upstream `alloc` and
the kernel's. This allows to easily inspect the kernel additions only,
especially to check if the fallible methods we already have still match
the infallible ones in the new version coming from upstream.

Another approach is reviewing the changes introduced in the additions in
the kernel fork between the two versions. This is useful to spot
potentially unintended changes to our additions.

To apply these approaches, one may follow steps similar to the following
to generate a pair of patches that show the differences between upstream
Rust and the kernel (for the subset of `alloc` we use) before and after
applying this patch:

    # Get the difference with respect to the old version.
    git -C rust checkout $(linux/scripts/min-tool-version.sh rustc)
    git -C linux ls-tree -r --name-only HEAD -- rust/alloc |
        cut -d/ -f3- |
        grep -Fv README.md |
        xargs -IPATH cp rust/library/alloc/src/PATH linux/rust/alloc/PATH
    git -C linux diff --patch-with-stat --summary -R > old.patch
    git -C linux restore rust/alloc

    # Apply this patch.
    git -C linux am rust-upgrade.patch

    # Get the difference with respect to the new version.
    git -C rust checkout $(linux/scripts/min-tool-version.sh rustc)
    git -C linux ls-tree -r --name-only HEAD -- rust/alloc |
        cut -d/ -f3- |
        grep -Fv README.md |
        xargs -IPATH cp rust/library/alloc/src/PATH linux/rust/alloc/PATH
    git -C linux diff --patch-with-stat --summary -R > new.patch
    git -C linux restore rust/alloc

Now one may check the `new.patch` to take a look at the additions (first
approach) or at the difference between those two patches (second
approach). For the latter, a side-by-side tool is recommended.

Link: https://github.com/rust-lang/rust/blob/stable/RELEASES.md#version-1730-2023-10-05 [1]
Link: https://rust-for-linux.com/rust-version-policy [2]
Link: https://github.com/Rust-for-Linux/linux/issues/2 [3]
Link: https://github.com/rust-lang/compiler-team/issues/596 [4]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 Documentation/process/changes.rst |  2 +-
 rust/alloc/alloc.rs               | 22 --------------
 rust/alloc/boxed.rs               | 48 ++++++++++++++++++++-----------
 rust/alloc/lib.rs                 |  5 ++--
 rust/alloc/raw_vec.rs             | 30 ++++++++++++-------
 rust/alloc/vec/mod.rs             |  4 +--
 rust/alloc/vec/spec_extend.rs     |  8 +++---
 rust/compiler_builtins.rs         |  1 +
 scripts/min-tool-version.sh       |  2 +-
 9 files changed, 63 insertions(+), 59 deletions(-)

diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index 731cc104c56f..bb96ca0f774b 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -31,7 +31,7 @@ you probably needn't concern yourself with pcmciautils.
 ====================== ===============  ========================================
 GNU C                  5.1              gcc --version
 Clang/LLVM (optional)  11.0.0           clang --version
-Rust (optional)        1.72.1           rustc --version
+Rust (optional)        1.73.0           rustc --version
 bindgen (optional)     0.65.1           bindgen --version
 GNU make               3.82             make --version
 bash                   4.2              bash --version
diff --git a/rust/alloc/alloc.rs b/rust/alloc/alloc.rs
index 51821feb20b1..8cb4a31cf6e5 100644
--- a/rust/alloc/alloc.rs
+++ b/rust/alloc/alloc.rs
@@ -6,11 +6,7 @@
 
 #[cfg(not(test))]
 use core::intrinsics;
-#[cfg(all(bootstrap, not(test)))]
-use core::intrinsics::{min_align_of_val, size_of_val};
 
-#[cfg(all(bootstrap, not(test)))]
-use core::ptr::Unique;
 #[cfg(not(test))]
 use core::ptr::{self, NonNull};
 
@@ -339,23 +335,6 @@ unsafe fn exchange_malloc(size: usize, align: usize) -> *mut u8 {
     }
 }
 
-#[cfg(all(bootstrap, not(test)))]
-#[lang = "box_free"]
-#[inline]
-// This signature has to be the same as `Box`, otherwise an ICE will happen.
-// When an additional parameter to `Box` is added (like `A: Allocator`), this has to be added here as
-// well.
-// For example if `Box` is changed to  `struct Box<T: ?Sized, A: Allocator>(Unique<T>, A)`,
-// this function has to be changed to `fn box_free<T: ?Sized, A: Allocator>(Unique<T>, A)` as well.
-unsafe fn box_free<T: ?Sized, A: Allocator>(ptr: Unique<T>, alloc: A) {
-    unsafe {
-        let size = size_of_val(ptr.as_ref());
-        let align = min_align_of_val(ptr.as_ref());
-        let layout = Layout::from_size_align_unchecked(size, align);
-        alloc.deallocate(From::from(ptr.cast()), layout)
-    }
-}
-
 // # Allocation error handler
 
 #[cfg(not(no_global_oom_handling))]
@@ -415,7 +394,6 @@ pub unsafe fn __rdl_oom(size: usize, _align: usize) -> ! {
             static __rust_alloc_error_handler_should_panic: u8;
         }
 
-        #[allow(unused_unsafe)]
         if unsafe { __rust_alloc_error_handler_should_panic != 0 } {
             panic!("memory allocation of {size} bytes failed")
         } else {
diff --git a/rust/alloc/boxed.rs b/rust/alloc/boxed.rs
index bdab710f7737..9620eba17268 100644
--- a/rust/alloc/boxed.rs
+++ b/rust/alloc/boxed.rs
@@ -159,12 +159,12 @@
 use core::iter::FusedIterator;
 use core::marker::Tuple;
 use core::marker::Unsize;
-use core::mem;
+use core::mem::{self, SizedTypeProperties};
 use core::ops::{
     CoerceUnsized, Deref, DerefMut, DispatchFromDyn, Generator, GeneratorState, Receiver,
 };
 use core::pin::Pin;
-use core::ptr::{self, Unique};
+use core::ptr::{self, NonNull, Unique};
 use core::task::{Context, Poll};
 
 #[cfg(not(no_global_oom_handling))]
@@ -483,8 +483,12 @@ pub fn try_new_uninit_in(alloc: A) -> Result<Box<mem::MaybeUninit<T>, A>, AllocE
     where
         A: Allocator,
     {
-        let layout = Layout::new::<mem::MaybeUninit<T>>();
-        let ptr = alloc.allocate(layout)?.cast();
+        let ptr = if T::IS_ZST {
+            NonNull::dangling()
+        } else {
+            let layout = Layout::new::<mem::MaybeUninit<T>>();
+            alloc.allocate(layout)?.cast()
+        };
         unsafe { Ok(Box::from_raw_in(ptr.as_ptr(), alloc)) }
     }
 
@@ -553,8 +557,12 @@ pub fn try_new_zeroed_in(alloc: A) -> Result<Box<mem::MaybeUninit<T>, A>, AllocE
     where
         A: Allocator,
     {
-        let layout = Layout::new::<mem::MaybeUninit<T>>();
-        let ptr = alloc.allocate_zeroed(layout)?.cast();
+        let ptr = if T::IS_ZST {
+            NonNull::dangling()
+        } else {
+            let layout = Layout::new::<mem::MaybeUninit<T>>();
+            alloc.allocate_zeroed(layout)?.cast()
+        };
         unsafe { Ok(Box::from_raw_in(ptr.as_ptr(), alloc)) }
     }
 
@@ -679,14 +687,16 @@ pub fn new_zeroed_slice(len: usize) -> Box<[mem::MaybeUninit<T>]> {
     #[unstable(feature = "allocator_api", issue = "32838")]
     #[inline]
     pub fn try_new_uninit_slice(len: usize) -> Result<Box<[mem::MaybeUninit<T>]>, AllocError> {
-        unsafe {
+        let ptr = if T::IS_ZST || len == 0 {
+            NonNull::dangling()
+        } else {
             let layout = match Layout::array::<mem::MaybeUninit<T>>(len) {
                 Ok(l) => l,
                 Err(_) => return Err(AllocError),
             };
-            let ptr = Global.allocate(layout)?;
-            Ok(RawVec::from_raw_parts_in(ptr.as_mut_ptr() as *mut _, len, Global).into_box(len))
-        }
+            Global.allocate(layout)?.cast()
+        };
+        unsafe { Ok(RawVec::from_raw_parts_in(ptr.as_ptr(), len, Global).into_box(len)) }
     }
 
     /// Constructs a new boxed slice with uninitialized contents, with the memory
@@ -711,14 +721,16 @@ pub fn try_new_uninit_slice(len: usize) -> Result<Box<[mem::MaybeUninit<T>]>, Al
     #[unstable(feature = "allocator_api", issue = "32838")]
     #[inline]
     pub fn try_new_zeroed_slice(len: usize) -> Result<Box<[mem::MaybeUninit<T>]>, AllocError> {
-        unsafe {
+        let ptr = if T::IS_ZST || len == 0 {
+            NonNull::dangling()
+        } else {
             let layout = match Layout::array::<mem::MaybeUninit<T>>(len) {
                 Ok(l) => l,
                 Err(_) => return Err(AllocError),
             };
-            let ptr = Global.allocate_zeroed(layout)?;
-            Ok(RawVec::from_raw_parts_in(ptr.as_mut_ptr() as *mut _, len, Global).into_box(len))
-        }
+            Global.allocate_zeroed(layout)?.cast()
+        };
+        unsafe { Ok(RawVec::from_raw_parts_in(ptr.as_ptr(), len, Global).into_box(len)) }
     }
 }
 
@@ -1223,7 +1235,9 @@ fn drop(&mut self) {
 
         unsafe {
             let layout = Layout::for_value_raw(ptr.as_ptr());
-            self.1.deallocate(From::from(ptr.cast()), layout)
+            if layout.size() != 0 {
+                self.1.deallocate(From::from(ptr.cast()), layout);
+            }
         }
     }
 }
@@ -2173,7 +2187,7 @@ pub fn downcast<T: Error + 'static>(self: Box<Self>) -> Result<Box<T>, Box<dyn E
         let err: Box<dyn Error> = self;
         <dyn Error>::downcast(err).map_err(|s| unsafe {
             // Reapply the `Send` marker.
-            mem::transmute::<Box<dyn Error>, Box<dyn Error + Send>>(s)
+            Box::from_raw(Box::into_raw(s) as *mut (dyn Error + Send))
         })
     }
 }
@@ -2187,7 +2201,7 @@ pub fn downcast<T: Error + 'static>(self: Box<Self>) -> Result<Box<T>, Box<Self>
         let err: Box<dyn Error> = self;
         <dyn Error>::downcast(err).map_err(|s| unsafe {
             // Reapply the `Send + Sync` marker.
-            mem::transmute::<Box<dyn Error>, Box<dyn Error + Send + Sync>>(s)
+            Box::from_raw(Box::into_raw(s) as *mut (dyn Error + Send + Sync))
         })
     }
 }
diff --git a/rust/alloc/lib.rs b/rust/alloc/lib.rs
index 115fcb053e73..73b9ffd845d9 100644
--- a/rust/alloc/lib.rs
+++ b/rust/alloc/lib.rs
@@ -60,7 +60,7 @@
 
 // To run alloc tests without x.py without ending up with two copies of alloc, Miri needs to be
 // able to "empty" this crate. See <https://github.com/rust-lang/miri-test-libstd/issues/4>.
-// rustc itself never sets the feature, so this line has no affect there.
+// rustc itself never sets the feature, so this line has no effect there.
 #![cfg(any(not(feature = "miri-test-libstd"), test, doctest))]
 //
 #![allow(unused_attributes)]
@@ -90,6 +90,8 @@
 #![warn(missing_docs)]
 #![allow(explicit_outlives_requirements)]
 #![warn(multiple_supertrait_upcastable)]
+#![cfg_attr(not(bootstrap), allow(internal_features))]
+#![cfg_attr(not(bootstrap), allow(rustdoc::redundant_explicit_links))]
 //
 // Library features:
 // tidy-alphabetical-start
@@ -139,7 +141,6 @@
 #![feature(maybe_uninit_uninit_array_transpose)]
 #![feature(pattern)]
 #![feature(pointer_byte_offsets)]
-#![feature(provide_any)]
 #![feature(ptr_internals)]
 #![feature(ptr_metadata)]
 #![feature(ptr_sub_ptr)]
diff --git a/rust/alloc/raw_vec.rs b/rust/alloc/raw_vec.rs
index 65d5ce15828e..a7425582a323 100644
--- a/rust/alloc/raw_vec.rs
+++ b/rust/alloc/raw_vec.rs
@@ -471,16 +471,26 @@ fn shrink(&mut self, cap: usize) -> Result<(), TryReserveError> {
         let (ptr, layout) = if let Some(mem) = self.current_memory() { mem } else { return Ok(()) };
         // See current_memory() why this assert is here
         let _: () = const { assert!(mem::size_of::<T>() % mem::align_of::<T>() == 0) };
-        let ptr = unsafe {
-            // `Layout::array` cannot overflow here because it would have
-            // overflowed earlier when capacity was larger.
-            let new_size = mem::size_of::<T>().unchecked_mul(cap);
-            let new_layout = Layout::from_size_align_unchecked(new_size, layout.align());
-            self.alloc
-                .shrink(ptr, layout, new_layout)
-                .map_err(|_| AllocError { layout: new_layout, non_exhaustive: () })?
-        };
-        self.set_ptr_and_cap(ptr, cap);
+
+        // If shrinking to 0, deallocate the buffer. We don't reach this point
+        // for the T::IS_ZST case since current_memory() will have returned
+        // None.
+        if cap == 0 {
+            unsafe { self.alloc.deallocate(ptr, layout) };
+            self.ptr = Unique::dangling();
+            self.cap = 0;
+        } else {
+            let ptr = unsafe {
+                // `Layout::array` cannot overflow here because it would have
+                // overflowed earlier when capacity was larger.
+                let new_size = mem::size_of::<T>().unchecked_mul(cap);
+                let new_layout = Layout::from_size_align_unchecked(new_size, layout.align());
+                self.alloc
+                    .shrink(ptr, layout, new_layout)
+                    .map_err(|_| AllocError { layout: new_layout, non_exhaustive: () })?
+            };
+            self.set_ptr_and_cap(ptr, cap);
+        }
         Ok(())
     }
 }
diff --git a/rust/alloc/vec/mod.rs b/rust/alloc/vec/mod.rs
index a4e9a5002a6d..209a88cfe598 100644
--- a/rust/alloc/vec/mod.rs
+++ b/rust/alloc/vec/mod.rs
@@ -216,7 +216,7 @@
 ///
 /// # Indexing
 ///
-/// The `Vec` type allows to access values by index, because it implements the
+/// The `Vec` type allows access to values by index, because it implements the
 /// [`Index`] trait. An example will be more explicit:
 ///
 /// ```
@@ -3263,7 +3263,7 @@ pub fn extract_if<F>(&mut self, filter: F) -> ExtractIf<'_, T, F, A>
 /// [`copy_from_slice`]: slice::copy_from_slice
 #[cfg(not(no_global_oom_handling))]
 #[stable(feature = "extend_ref", since = "1.2.0")]
-impl<'a, T: Copy + 'a, A: Allocator + 'a> Extend<&'a T> for Vec<T, A> {
+impl<'a, T: Copy + 'a, A: Allocator> Extend<&'a T> for Vec<T, A> {
     fn extend<I: IntoIterator<Item = &'a T>>(&mut self, iter: I) {
         self.spec_extend(iter.into_iter())
     }
diff --git a/rust/alloc/vec/spec_extend.rs b/rust/alloc/vec/spec_extend.rs
index a6a735201e59..ada919537446 100644
--- a/rust/alloc/vec/spec_extend.rs
+++ b/rust/alloc/vec/spec_extend.rs
@@ -77,7 +77,7 @@ fn try_spec_extend(&mut self, mut iterator: IntoIter<T>) -> Result<(), TryReserv
 }
 
 #[cfg(not(no_global_oom_handling))]
-impl<'a, T: 'a, I, A: Allocator + 'a> SpecExtend<&'a T, I> for Vec<T, A>
+impl<'a, T: 'a, I, A: Allocator> SpecExtend<&'a T, I> for Vec<T, A>
 where
     I: Iterator<Item = &'a T>,
     T: Clone,
@@ -87,7 +87,7 @@ impl<'a, T: 'a, I, A: Allocator + 'a> SpecExtend<&'a T, I> for Vec<T, A>
     }
 }
 
-impl<'a, T: 'a, I, A: Allocator + 'a> TrySpecExtend<&'a T, I> for Vec<T, A>
+impl<'a, T: 'a, I, A: Allocator> TrySpecExtend<&'a T, I> for Vec<T, A>
 where
     I: Iterator<Item = &'a T>,
     T: Clone,
@@ -98,7 +98,7 @@ impl<'a, T: 'a, I, A: Allocator + 'a> TrySpecExtend<&'a T, I> for Vec<T, A>
 }
 
 #[cfg(not(no_global_oom_handling))]
-impl<'a, T: 'a, A: Allocator + 'a> SpecExtend<&'a T, slice::Iter<'a, T>> for Vec<T, A>
+impl<'a, T: 'a, A: Allocator> SpecExtend<&'a T, slice::Iter<'a, T>> for Vec<T, A>
 where
     T: Copy,
 {
@@ -108,7 +108,7 @@ fn spec_extend(&mut self, iterator: slice::Iter<'a, T>) {
     }
 }
 
-impl<'a, T: 'a, A: Allocator + 'a> TrySpecExtend<&'a T, slice::Iter<'a, T>> for Vec<T, A>
+impl<'a, T: 'a, A: Allocator> TrySpecExtend<&'a T, slice::Iter<'a, T>> for Vec<T, A>
 where
     T: Copy,
 {
diff --git a/rust/compiler_builtins.rs b/rust/compiler_builtins.rs
index fb8ac3f211de..bba2922c6ef7 100644
--- a/rust/compiler_builtins.rs
+++ b/rust/compiler_builtins.rs
@@ -19,6 +19,7 @@
 //! [`compiler_builtins`]: https://github.com/rust-lang/compiler-builtins
 //! [`compiler-rt`]: https://compiler-rt.llvm.org/
 
+#![allow(internal_features)]
 #![feature(compiler_builtins)]
 #![compiler_builtins]
 #![no_builtins]
diff --git a/scripts/min-tool-version.sh b/scripts/min-tool-version.sh
index dc819612ff6a..fd5ffdb81bab 100755
--- a/scripts/min-tool-version.sh
+++ b/scripts/min-tool-version.sh
@@ -31,7 +31,7 @@ llvm)
 	fi
 	;;
 rustc)
-	echo 1.72.1
+	echo 1.73.0
 	;;
 bindgen)
 	echo 0.65.1
-- 
2.42.0


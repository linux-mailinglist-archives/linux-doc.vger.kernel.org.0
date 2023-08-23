Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BF67785CD8
	for <lists+linux-doc@lfdr.de>; Wed, 23 Aug 2023 18:03:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235366AbjHWQDN (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 23 Aug 2023 12:03:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232029AbjHWQDM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Aug 2023 12:03:12 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF1DBE78;
        Wed, 23 Aug 2023 09:03:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2A26664DE2;
        Wed, 23 Aug 2023 16:03:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4F0EC433C8;
        Wed, 23 Aug 2023 16:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692806586;
        bh=iOGPgr9FKeMCxvdHRdZM3C/ySENAE1+H1rw84ygxa+k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Fyhcs8VIIrn9vUNj1IPtyjqIDc+xSdgzvpMaBYsiVMOZFQi67EH4c7Byzox0slM6S
         CRtj7rsCMHkf3A6rR1a/R7f0Eav+2GRScAvIeQ0f7Vmnc+ZQafZyp+tz+M0QsXXZHq
         pyN6ZZGG56/znHn1XsqMnLXhXUa5gwZgIETlBde8Kl/RPZ5Fx+MyK9TMBU+/U/K0xK
         OJsTTYeLxUG2t05Sy2uSH+jb9gvXrNHQg+wVE+PZoS8indNKXLWuTzaAJ2tLF16kta
         K1uwBoNH4JKyAWrixfkkeZZcroUazMaY5PtXqML4XMeSldX3VVdUeTFxmDMltdNCEq
         JMcUibqMdCo0Q==
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
Subject: [PATCH 2/2] rust: upgrade to Rust 1.72.0
Date:   Wed, 23 Aug 2023 18:02:43 +0200
Message-ID: <20230823160244.188033-3-ojeda@kernel.org>
In-Reply-To: <20230823160244.188033-1-ojeda@kernel.org>
References: <20230823160244.188033-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This is the second upgrade to the Rust toolchain, from 1.71.1 to 1.72.0
(i.e. the latest) [1].

See the upgrade policy [2] and the comments on the first upgrade in
commit 3ed03f4da06e ("rust: upgrade to Rust 1.68.2").

# Unstable features

No unstable features (that we use) were stabilized.

Therefore, the only unstable feature allowed to be used outside
the `kernel` crate is still `new_uninit`, though other code to be
upstreamed may increase the list.

Please see [3] for details.

# Other improvements

Previously, the compiler could incorrectly generate a `.eh_frame`
section under `-Cpanic=abort`. We were hitting this bug in our
old `rust` branch [4]. Gary fixed the issue in Rust 1.72.0 [5].

# Required changes

For the upgrade, the following changes are required:

  - A call to `Box::from_raw` in `rust/kernel/sync/arc.rs` now requires
    an explicit `drop()` call. See previous patch for details.

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

Link: https://github.com/rust-lang/rust/blob/stable/RELEASES.md#version-1720-2023-08-24 [1]
Link: https://rust-for-linux.com/rust-version-policy [2]
Link: https://github.com/Rust-for-Linux/linux/issues/2 [3]
Closes: https://github.com/Rust-for-Linux/linux/issues/1012 [4]
Link: https://github.com/rust-lang/rust/pull/112403 [5]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 Documentation/process/changes.rst |   2 +-
 rust/alloc/alloc.rs               |   9 +-
 rust/alloc/boxed.rs               |  10 +-
 rust/alloc/lib.rs                 |  10 +-
 rust/alloc/vec/drain_filter.rs    | 199 ------------------------------
 rust/alloc/vec/extract_if.rs      | 115 +++++++++++++++++
 rust/alloc/vec/mod.rs             | 106 ++++++++--------
 scripts/min-tool-version.sh       |   2 +-
 8 files changed, 187 insertions(+), 266 deletions(-)
 delete mode 100644 rust/alloc/vec/drain_filter.rs
 create mode 100644 rust/alloc/vec/extract_if.rs

diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index 0bbd040f6a55..1ea95fb5af62 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -31,7 +31,7 @@ you probably needn't concern yourself with pcmciautils.
 ====================== ===============  ========================================
 GNU C                  5.1              gcc --version
 Clang/LLVM (optional)  11.0.0           clang --version
-Rust (optional)        1.71.1           rustc --version
+Rust (optional)        1.72.0           rustc --version
 bindgen (optional)     0.65.1           bindgen --version
 GNU make               3.82             make --version
 bash                   4.2              bash --version
diff --git a/rust/alloc/alloc.rs b/rust/alloc/alloc.rs
index 0b6bf5b6da43..51821feb20b1 100644
--- a/rust/alloc/alloc.rs
+++ b/rust/alloc/alloc.rs
@@ -6,8 +6,10 @@
 
 #[cfg(not(test))]
 use core::intrinsics;
+#[cfg(all(bootstrap, not(test)))]
 use core::intrinsics::{min_align_of_val, size_of_val};
 
+#[cfg(all(bootstrap, not(test)))]
 use core::ptr::Unique;
 #[cfg(not(test))]
 use core::ptr::{self, NonNull};
@@ -40,7 +42,6 @@
     #[rustc_nounwind]
     fn __rust_alloc_zeroed(size: usize, align: usize) -> *mut u8;
 
-    #[cfg(not(bootstrap))]
     static __rust_no_alloc_shim_is_unstable: u8;
 }
 
@@ -98,7 +99,6 @@ pub unsafe fn alloc(layout: Layout) -> *mut u8 {
     unsafe {
         // Make sure we don't accidentally allow omitting the allocator shim in
         // stable code until it is actually stabilized.
-        #[cfg(not(bootstrap))]
         core::ptr::read_volatile(&__rust_no_alloc_shim_is_unstable);
 
         __rust_alloc(layout.size(), layout.align())
@@ -339,14 +339,15 @@ unsafe fn exchange_malloc(size: usize, align: usize) -> *mut u8 {
     }
 }
 
-#[cfg_attr(not(test), lang = "box_free")]
+#[cfg(all(bootstrap, not(test)))]
+#[lang = "box_free"]
 #[inline]
 // This signature has to be the same as `Box`, otherwise an ICE will happen.
 // When an additional parameter to `Box` is added (like `A: Allocator`), this has to be added here as
 // well.
 // For example if `Box` is changed to  `struct Box<T: ?Sized, A: Allocator>(Unique<T>, A)`,
 // this function has to be changed to `fn box_free<T: ?Sized, A: Allocator>(Unique<T>, A)` as well.
-pub(crate) unsafe fn box_free<T: ?Sized, A: Allocator>(ptr: Unique<T>, alloc: A) {
+unsafe fn box_free<T: ?Sized, A: Allocator>(ptr: Unique<T>, alloc: A) {
     unsafe {
         let size = size_of_val(ptr.as_ref());
         let align = min_align_of_val(ptr.as_ref());
diff --git a/rust/alloc/boxed.rs b/rust/alloc/boxed.rs
index c8173cea8317..bdab710f7737 100644
--- a/rust/alloc/boxed.rs
+++ b/rust/alloc/boxed.rs
@@ -1215,8 +1215,16 @@ pub const fn into_pin(boxed: Self) -> Pin<Self>
 
 #[stable(feature = "rust1", since = "1.0.0")]
 unsafe impl<#[may_dangle] T: ?Sized, A: Allocator> Drop for Box<T, A> {
+    #[inline]
     fn drop(&mut self) {
-        // FIXME: Do nothing, drop is currently performed by compiler.
+        // the T in the Box is dropped by the compiler before the destructor is run
+
+        let ptr = self.0;
+
+        unsafe {
+            let layout = Layout::for_value_raw(ptr.as_ptr());
+            self.1.deallocate(From::from(ptr.cast()), layout)
+        }
     }
 }
 
diff --git a/rust/alloc/lib.rs b/rust/alloc/lib.rs
index 85e91356ecb3..115fcb053e73 100644
--- a/rust/alloc/lib.rs
+++ b/rust/alloc/lib.rs
@@ -58,6 +58,11 @@
 //! [`Rc`]: rc
 //! [`RefCell`]: core::cell
 
+// To run alloc tests without x.py without ending up with two copies of alloc, Miri needs to be
+// able to "empty" this crate. See <https://github.com/rust-lang/miri-test-libstd/issues/4>.
+// rustc itself never sets the feature, so this line has no affect there.
+#![cfg(any(not(feature = "miri-test-libstd"), test, doctest))]
+//
 #![allow(unused_attributes)]
 #![stable(feature = "alloc", since = "1.36.0")]
 #![doc(
@@ -77,11 +82,6 @@
 ))]
 #![no_std]
 #![needs_allocator]
-// To run alloc tests without x.py without ending up with two copies of alloc, Miri needs to be
-// able to "empty" this crate. See <https://github.com/rust-lang/miri-test-libstd/issues/4>.
-// rustc itself never sets the feature, so this line has no affect there.
-#![cfg(any(not(feature = "miri-test-libstd"), test, doctest))]
-//
 // Lints:
 #![deny(unsafe_op_in_unsafe_fn)]
 #![deny(fuzzy_provenance_casts)]
diff --git a/rust/alloc/vec/drain_filter.rs b/rust/alloc/vec/drain_filter.rs
deleted file mode 100644
index 09efff090e42..000000000000
--- a/rust/alloc/vec/drain_filter.rs
+++ /dev/null
@@ -1,199 +0,0 @@
-// SPDX-License-Identifier: Apache-2.0 OR MIT
-
-use crate::alloc::{Allocator, Global};
-use core::mem::{ManuallyDrop, SizedTypeProperties};
-use core::ptr;
-use core::slice;
-
-use super::Vec;
-
-/// An iterator which uses a closure to determine if an element should be removed.
-///
-/// This struct is created by [`Vec::drain_filter`].
-/// See its documentation for more.
-///
-/// # Example
-///
-/// ```
-/// #![feature(drain_filter)]
-///
-/// let mut v = vec![0, 1, 2];
-/// let iter: std::vec::DrainFilter<'_, _, _> = v.drain_filter(|x| *x % 2 == 0);
-/// ```
-#[unstable(feature = "drain_filter", reason = "recently added", issue = "43244")]
-#[derive(Debug)]
-pub struct DrainFilter<
-    'a,
-    T,
-    F,
-    #[unstable(feature = "allocator_api", issue = "32838")] A: Allocator = Global,
-> where
-    F: FnMut(&mut T) -> bool,
-{
-    pub(super) vec: &'a mut Vec<T, A>,
-    /// The index of the item that will be inspected by the next call to `next`.
-    pub(super) idx: usize,
-    /// The number of items that have been drained (removed) thus far.
-    pub(super) del: usize,
-    /// The original length of `vec` prior to draining.
-    pub(super) old_len: usize,
-    /// The filter test predicate.
-    pub(super) pred: F,
-    /// A flag that indicates a panic has occurred in the filter test predicate.
-    /// This is used as a hint in the drop implementation to prevent consumption
-    /// of the remainder of the `DrainFilter`. Any unprocessed items will be
-    /// backshifted in the `vec`, but no further items will be dropped or
-    /// tested by the filter predicate.
-    pub(super) panic_flag: bool,
-}
-
-impl<T, F, A: Allocator> DrainFilter<'_, T, F, A>
-where
-    F: FnMut(&mut T) -> bool,
-{
-    /// Returns a reference to the underlying allocator.
-    #[unstable(feature = "allocator_api", issue = "32838")]
-    #[inline]
-    pub fn allocator(&self) -> &A {
-        self.vec.allocator()
-    }
-
-    /// Keep unyielded elements in the source `Vec`.
-    ///
-    /// # Examples
-    ///
-    /// ```
-    /// #![feature(drain_filter)]
-    /// #![feature(drain_keep_rest)]
-    ///
-    /// let mut vec = vec!['a', 'b', 'c'];
-    /// let mut drain = vec.drain_filter(|_| true);
-    ///
-    /// assert_eq!(drain.next().unwrap(), 'a');
-    ///
-    /// // This call keeps 'b' and 'c' in the vec.
-    /// drain.keep_rest();
-    ///
-    /// // If we wouldn't call `keep_rest()`,
-    /// // `vec` would be empty.
-    /// assert_eq!(vec, ['b', 'c']);
-    /// ```
-    #[unstable(feature = "drain_keep_rest", issue = "101122")]
-    pub fn keep_rest(self) {
-        // At this moment layout looks like this:
-        //
-        //  _____________________/-- old_len
-        // /                     \
-        // [kept] [yielded] [tail]
-        //        \_______/ ^-- idx
-        //                \-- del
-        //
-        // Normally `Drop` impl would drop [tail] (via .for_each(drop), ie still calling `pred`)
-        //
-        // 1. Move [tail] after [kept]
-        // 2. Update length of the original vec to `old_len - del`
-        //    a. In case of ZST, this is the only thing we want to do
-        // 3. Do *not* drop self, as everything is put in a consistent state already, there is nothing to do
-        let mut this = ManuallyDrop::new(self);
-
-        unsafe {
-            // ZSTs have no identity, so we don't need to move them around.
-            if !T::IS_ZST && this.idx < this.old_len && this.del > 0 {
-                let ptr = this.vec.as_mut_ptr();
-                let src = ptr.add(this.idx);
-                let dst = src.sub(this.del);
-                let tail_len = this.old_len - this.idx;
-                src.copy_to(dst, tail_len);
-            }
-
-            let new_len = this.old_len - this.del;
-            this.vec.set_len(new_len);
-        }
-    }
-}
-
-#[unstable(feature = "drain_filter", reason = "recently added", issue = "43244")]
-impl<T, F, A: Allocator> Iterator for DrainFilter<'_, T, F, A>
-where
-    F: FnMut(&mut T) -> bool,
-{
-    type Item = T;
-
-    fn next(&mut self) -> Option<T> {
-        unsafe {
-            while self.idx < self.old_len {
-                let i = self.idx;
-                let v = slice::from_raw_parts_mut(self.vec.as_mut_ptr(), self.old_len);
-                self.panic_flag = true;
-                let drained = (self.pred)(&mut v[i]);
-                self.panic_flag = false;
-                // Update the index *after* the predicate is called. If the index
-                // is updated prior and the predicate panics, the element at this
-                // index would be leaked.
-                self.idx += 1;
-                if drained {
-                    self.del += 1;
-                    return Some(ptr::read(&v[i]));
-                } else if self.del > 0 {
-                    let del = self.del;
-                    let src: *const T = &v[i];
-                    let dst: *mut T = &mut v[i - del];
-                    ptr::copy_nonoverlapping(src, dst, 1);
-                }
-            }
-            None
-        }
-    }
-
-    fn size_hint(&self) -> (usize, Option<usize>) {
-        (0, Some(self.old_len - self.idx))
-    }
-}
-
-#[unstable(feature = "drain_filter", reason = "recently added", issue = "43244")]
-impl<T, F, A: Allocator> Drop for DrainFilter<'_, T, F, A>
-where
-    F: FnMut(&mut T) -> bool,
-{
-    fn drop(&mut self) {
-        struct BackshiftOnDrop<'a, 'b, T, F, A: Allocator>
-        where
-            F: FnMut(&mut T) -> bool,
-        {
-            drain: &'b mut DrainFilter<'a, T, F, A>,
-        }
-
-        impl<'a, 'b, T, F, A: Allocator> Drop for BackshiftOnDrop<'a, 'b, T, F, A>
-        where
-            F: FnMut(&mut T) -> bool,
-        {
-            fn drop(&mut self) {
-                unsafe {
-                    if self.drain.idx < self.drain.old_len && self.drain.del > 0 {
-                        // This is a pretty messed up state, and there isn't really an
-                        // obviously right thing to do. We don't want to keep trying
-                        // to execute `pred`, so we just backshift all the unprocessed
-                        // elements and tell the vec that they still exist. The backshift
-                        // is required to prevent a double-drop of the last successfully
-                        // drained item prior to a panic in the predicate.
-                        let ptr = self.drain.vec.as_mut_ptr();
-                        let src = ptr.add(self.drain.idx);
-                        let dst = src.sub(self.drain.del);
-                        let tail_len = self.drain.old_len - self.drain.idx;
-                        src.copy_to(dst, tail_len);
-                    }
-                    self.drain.vec.set_len(self.drain.old_len - self.drain.del);
-                }
-            }
-        }
-
-        let backshift = BackshiftOnDrop { drain: self };
-
-        // Attempt to consume any remaining elements if the filter predicate
-        // has not yet panicked. We'll backshift any remaining elements
-        // whether we've already panicked or if the consumption here panics.
-        if !backshift.drain.panic_flag {
-            backshift.drain.for_each(drop);
-        }
-    }
-}
diff --git a/rust/alloc/vec/extract_if.rs b/rust/alloc/vec/extract_if.rs
new file mode 100644
index 000000000000..f314a51d4d3d
--- /dev/null
+++ b/rust/alloc/vec/extract_if.rs
@@ -0,0 +1,115 @@
+// SPDX-License-Identifier: Apache-2.0 OR MIT
+
+use crate::alloc::{Allocator, Global};
+use core::ptr;
+use core::slice;
+
+use super::Vec;
+
+/// An iterator which uses a closure to determine if an element should be removed.
+///
+/// This struct is created by [`Vec::extract_if`].
+/// See its documentation for more.
+///
+/// # Example
+///
+/// ```
+/// #![feature(extract_if)]
+///
+/// let mut v = vec![0, 1, 2];
+/// let iter: std::vec::ExtractIf<'_, _, _> = v.extract_if(|x| *x % 2 == 0);
+/// ```
+#[unstable(feature = "extract_if", reason = "recently added", issue = "43244")]
+#[derive(Debug)]
+#[must_use = "iterators are lazy and do nothing unless consumed"]
+pub struct ExtractIf<
+    'a,
+    T,
+    F,
+    #[unstable(feature = "allocator_api", issue = "32838")] A: Allocator = Global,
+> where
+    F: FnMut(&mut T) -> bool,
+{
+    pub(super) vec: &'a mut Vec<T, A>,
+    /// The index of the item that will be inspected by the next call to `next`.
+    pub(super) idx: usize,
+    /// The number of items that have been drained (removed) thus far.
+    pub(super) del: usize,
+    /// The original length of `vec` prior to draining.
+    pub(super) old_len: usize,
+    /// The filter test predicate.
+    pub(super) pred: F,
+}
+
+impl<T, F, A: Allocator> ExtractIf<'_, T, F, A>
+where
+    F: FnMut(&mut T) -> bool,
+{
+    /// Returns a reference to the underlying allocator.
+    #[unstable(feature = "allocator_api", issue = "32838")]
+    #[inline]
+    pub fn allocator(&self) -> &A {
+        self.vec.allocator()
+    }
+}
+
+#[unstable(feature = "extract_if", reason = "recently added", issue = "43244")]
+impl<T, F, A: Allocator> Iterator for ExtractIf<'_, T, F, A>
+where
+    F: FnMut(&mut T) -> bool,
+{
+    type Item = T;
+
+    fn next(&mut self) -> Option<T> {
+        unsafe {
+            while self.idx < self.old_len {
+                let i = self.idx;
+                let v = slice::from_raw_parts_mut(self.vec.as_mut_ptr(), self.old_len);
+                let drained = (self.pred)(&mut v[i]);
+                // Update the index *after* the predicate is called. If the index
+                // is updated prior and the predicate panics, the element at this
+                // index would be leaked.
+                self.idx += 1;
+                if drained {
+                    self.del += 1;
+                    return Some(ptr::read(&v[i]));
+                } else if self.del > 0 {
+                    let del = self.del;
+                    let src: *const T = &v[i];
+                    let dst: *mut T = &mut v[i - del];
+                    ptr::copy_nonoverlapping(src, dst, 1);
+                }
+            }
+            None
+        }
+    }
+
+    fn size_hint(&self) -> (usize, Option<usize>) {
+        (0, Some(self.old_len - self.idx))
+    }
+}
+
+#[unstable(feature = "extract_if", reason = "recently added", issue = "43244")]
+impl<T, F, A: Allocator> Drop for ExtractIf<'_, T, F, A>
+where
+    F: FnMut(&mut T) -> bool,
+{
+    fn drop(&mut self) {
+        unsafe {
+            if self.idx < self.old_len && self.del > 0 {
+                // This is a pretty messed up state, and there isn't really an
+                // obviously right thing to do. We don't want to keep trying
+                // to execute `pred`, so we just backshift all the unprocessed
+                // elements and tell the vec that they still exist. The backshift
+                // is required to prevent a double-drop of the last successfully
+                // drained item prior to a panic in the predicate.
+                let ptr = self.vec.as_mut_ptr();
+                let src = ptr.add(self.idx);
+                let dst = src.sub(self.del);
+                let tail_len = self.old_len - self.idx;
+                src.copy_to(dst, tail_len);
+            }
+            self.vec.set_len(self.old_len - self.del);
+        }
+    }
+}
diff --git a/rust/alloc/vec/mod.rs b/rust/alloc/vec/mod.rs
index 05c70de0227e..a4e9a5002a6d 100644
--- a/rust/alloc/vec/mod.rs
+++ b/rust/alloc/vec/mod.rs
@@ -74,10 +74,10 @@
 use crate::collections::{TryReserveError, TryReserveErrorKind};
 use crate::raw_vec::RawVec;
 
-#[unstable(feature = "drain_filter", reason = "recently added", issue = "43244")]
-pub use self::drain_filter::DrainFilter;
+#[unstable(feature = "extract_if", reason = "recently added", issue = "43244")]
+pub use self::extract_if::ExtractIf;
 
-mod drain_filter;
+mod extract_if;
 
 #[cfg(not(no_global_oom_handling))]
 #[stable(feature = "vec_splice", since = "1.21.0")]
@@ -618,22 +618,20 @@ pub fn try_with_capacity(capacity: usize) -> Result<Self, TryReserveError> {
     /// Using memory that was allocated elsewhere:
     ///
     /// ```rust
-    /// #![feature(allocator_api)]
-    ///
-    /// use std::alloc::{AllocError, Allocator, Global, Layout};
+    /// use std::alloc::{alloc, Layout};
     ///
     /// fn main() {
     ///     let layout = Layout::array::<u32>(16).expect("overflow cannot happen");
     ///
     ///     let vec = unsafe {
-    ///         let mem = match Global.allocate(layout) {
-    ///             Ok(mem) => mem.cast::<u32>().as_ptr(),
-    ///             Err(AllocError) => return,
-    ///         };
+    ///         let mem = alloc(layout).cast::<u32>();
+    ///         if mem.is_null() {
+    ///             return;
+    ///         }
     ///
     ///         mem.write(1_000_000);
     ///
-    ///         Vec::from_raw_parts_in(mem, 1, 16, Global)
+    ///         Vec::from_raw_parts(mem, 1, 16)
     ///     };
     ///
     ///     assert_eq!(vec, &[1_000_000]);
@@ -876,19 +874,22 @@ pub fn try_with_capacity_in(capacity: usize, alloc: A) -> Result<Self, TryReserv
     /// Using memory that was allocated elsewhere:
     ///
     /// ```rust
-    /// use std::alloc::{alloc, Layout};
+    /// #![feature(allocator_api)]
+    ///
+    /// use std::alloc::{AllocError, Allocator, Global, Layout};
     ///
     /// fn main() {
     ///     let layout = Layout::array::<u32>(16).expect("overflow cannot happen");
+    ///
     ///     let vec = unsafe {
-    ///         let mem = alloc(layout).cast::<u32>();
-    ///         if mem.is_null() {
-    ///             return;
-    ///         }
+    ///         let mem = match Global.allocate(layout) {
+    ///             Ok(mem) => mem.cast::<u32>().as_ptr(),
+    ///             Err(AllocError) => return,
+    ///         };
     ///
     ///         mem.write(1_000_000);
     ///
-    ///         Vec::from_raw_parts(mem, 1, 16)
+    ///         Vec::from_raw_parts_in(mem, 1, 16, Global)
     ///     };
     ///
     ///     assert_eq!(vec, &[1_000_000]);
@@ -2507,7 +2508,7 @@ pub fn resize(&mut self, new_len: usize, value: T) {
         let len = self.len();
 
         if new_len > len {
-            self.extend_with(new_len - len, ExtendElement(value))
+            self.extend_with(new_len - len, value)
         } else {
             self.truncate(new_len);
         }
@@ -2545,7 +2546,7 @@ pub fn try_resize(&mut self, new_len: usize, value: T) -> Result<(), TryReserveE
         let len = self.len();
 
         if new_len > len {
-            self.try_extend_with(new_len - len, ExtendElement(value))
+            self.try_extend_with(new_len - len, value)
         } else {
             self.truncate(new_len);
             Ok(())
@@ -2684,26 +2685,10 @@ pub fn into_flattened(self) -> Vec<T, A> {
     }
 }
 
-// This code generalizes `extend_with_{element,default}`.
-trait ExtendWith<T> {
-    fn next(&mut self) -> T;
-    fn last(self) -> T;
-}
-
-struct ExtendElement<T>(T);
-impl<T: Clone> ExtendWith<T> for ExtendElement<T> {
-    fn next(&mut self) -> T {
-        self.0.clone()
-    }
-    fn last(self) -> T {
-        self.0
-    }
-}
-
-impl<T, A: Allocator> Vec<T, A> {
+impl<T: Clone, A: Allocator> Vec<T, A> {
     #[cfg(not(no_global_oom_handling))]
-    /// Extend the vector by `n` values, using the given generator.
-    fn extend_with<E: ExtendWith<T>>(&mut self, n: usize, mut value: E) {
+    /// Extend the vector by `n` clones of value.
+    fn extend_with(&mut self, n: usize, value: T) {
         self.reserve(n);
 
         unsafe {
@@ -2715,15 +2700,15 @@ fn extend_with<E: ExtendWith<T>>(&mut self, n: usize, mut value: E) {
 
             // Write all elements except the last one
             for _ in 1..n {
-                ptr::write(ptr, value.next());
+                ptr::write(ptr, value.clone());
                 ptr = ptr.add(1);
-                // Increment the length in every step in case next() panics
+                // Increment the length in every step in case clone() panics
                 local_len.increment_len(1);
             }
 
             if n > 0 {
                 // We can write the last element directly without cloning needlessly
-                ptr::write(ptr, value.last());
+                ptr::write(ptr, value);
                 local_len.increment_len(1);
             }
 
@@ -2731,8 +2716,8 @@ fn extend_with<E: ExtendWith<T>>(&mut self, n: usize, mut value: E) {
         }
     }
 
-    /// Try to extend the vector by `n` values, using the given generator.
-    fn try_extend_with<E: ExtendWith<T>>(&mut self, n: usize, mut value: E) -> Result<(), TryReserveError> {
+    /// Try to extend the vector by `n` clones of value.
+    fn try_extend_with(&mut self, n: usize, value: T) -> Result<(), TryReserveError> {
         self.try_reserve(n)?;
 
         unsafe {
@@ -2744,15 +2729,15 @@ fn try_extend_with<E: ExtendWith<T>>(&mut self, n: usize, mut value: E) -> Resul
 
             // Write all elements except the last one
             for _ in 1..n {
-                ptr::write(ptr, value.next());
+                ptr::write(ptr, value.clone());
                 ptr = ptr.add(1);
-                // Increment the length in every step in case next() panics
+                // Increment the length in every step in case clone() panics
                 local_len.increment_len(1);
             }
 
             if n > 0 {
                 // We can write the last element directly without cloning needlessly
-                ptr::write(ptr, value.last());
+                ptr::write(ptr, value);
                 local_len.increment_len(1);
             }
 
@@ -3210,6 +3195,12 @@ pub fn splice<R, I>(&mut self, range: R, replace_with: I) -> Splice<'_, I::IntoI
     /// If the closure returns false, the element will remain in the vector and will not be yielded
     /// by the iterator.
     ///
+    /// If the returned `ExtractIf` is not exhausted, e.g. because it is dropped without iterating
+    /// or the iteration short-circuits, then the remaining elements will be retained.
+    /// Use [`retain`] with a negated predicate if you do not need the returned iterator.
+    ///
+    /// [`retain`]: Vec::retain
+    ///
     /// Using this method is equivalent to the following code:
     ///
     /// ```
@@ -3228,10 +3219,10 @@ pub fn splice<R, I>(&mut self, range: R, replace_with: I) -> Splice<'_, I::IntoI
     /// # assert_eq!(vec, vec![1, 4, 5]);
     /// ```
     ///
-    /// But `drain_filter` is easier to use. `drain_filter` is also more efficient,
+    /// But `extract_if` is easier to use. `extract_if` is also more efficient,
     /// because it can backshift the elements of the array in bulk.
     ///
-    /// Note that `drain_filter` also lets you mutate every element in the filter closure,
+    /// Note that `extract_if` also lets you mutate every element in the filter closure,
     /// regardless of whether you choose to keep or remove it.
     ///
     /// # Examples
@@ -3239,17 +3230,17 @@ pub fn splice<R, I>(&mut self, range: R, replace_with: I) -> Splice<'_, I::IntoI
     /// Splitting an array into evens and odds, reusing the original allocation:
     ///
     /// ```
-    /// #![feature(drain_filter)]
+    /// #![feature(extract_if)]
     /// let mut numbers = vec![1, 2, 3, 4, 5, 6, 8, 9, 11, 13, 14, 15];
     ///
-    /// let evens = numbers.drain_filter(|x| *x % 2 == 0).collect::<Vec<_>>();
+    /// let evens = numbers.extract_if(|x| *x % 2 == 0).collect::<Vec<_>>();
     /// let odds = numbers;
     ///
     /// assert_eq!(evens, vec![2, 4, 6, 8, 14]);
     /// assert_eq!(odds, vec![1, 3, 5, 9, 11, 13, 15]);
     /// ```
-    #[unstable(feature = "drain_filter", reason = "recently added", issue = "43244")]
-    pub fn drain_filter<F>(&mut self, filter: F) -> DrainFilter<'_, T, F, A>
+    #[unstable(feature = "extract_if", reason = "recently added", issue = "43244")]
+    pub fn extract_if<F>(&mut self, filter: F) -> ExtractIf<'_, T, F, A>
     where
         F: FnMut(&mut T) -> bool,
     {
@@ -3260,7 +3251,7 @@ pub fn drain_filter<F>(&mut self, filter: F) -> DrainFilter<'_, T, F, A>
             self.set_len(0);
         }
 
-        DrainFilter { vec: self, idx: 0, del: 0, old_len, pred: filter, panic_flag: false }
+        ExtractIf { vec: self, idx: 0, del: 0, old_len, pred: filter }
     }
 }
 
@@ -3290,9 +3281,14 @@ fn extend_reserve(&mut self, additional: usize) {
 
 /// Implements comparison of vectors, [lexicographically](Ord#lexicographical-comparison).
 #[stable(feature = "rust1", since = "1.0.0")]
-impl<T: PartialOrd, A: Allocator> PartialOrd for Vec<T, A> {
+impl<T, A1, A2> PartialOrd<Vec<T, A2>> for Vec<T, A1>
+where
+    T: PartialOrd,
+    A1: Allocator,
+    A2: Allocator,
+{
     #[inline]
-    fn partial_cmp(&self, other: &Self) -> Option<Ordering> {
+    fn partial_cmp(&self, other: &Vec<T, A2>) -> Option<Ordering> {
         PartialOrd::partial_cmp(&**self, &**other)
     }
 }
diff --git a/scripts/min-tool-version.sh b/scripts/min-tool-version.sh
index d65ab8bfeaf4..9520612dd398 100755
--- a/scripts/min-tool-version.sh
+++ b/scripts/min-tool-version.sh
@@ -31,7 +31,7 @@ llvm)
 	fi
 	;;
 rustc)
-	echo 1.71.1
+	echo 1.72.0
 	;;
 bindgen)
 	echo 0.65.1
-- 
2.42.0


Return-Path: <linux-doc+bounces-82025-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMZ6BFUPzWmMZwYAu9opvQ
	(envelope-from <linux-doc+bounces-82025-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 01 Apr 2026 14:28:05 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9534F37A709
	for <lists+linux-doc@lfdr.de>; Wed, 01 Apr 2026 14:28:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AAC46306F5FC
	for <lists+linux-doc@lfdr.de>; Wed,  1 Apr 2026 11:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D44B40626E;
	Wed,  1 Apr 2026 11:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W7RUQV2H"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFBB3E7172;
	Wed,  1 Apr 2026 11:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775044081; cv=none; b=cEoXMp62PKRfyd7itFESuIoRLQSM3ANfIv1Hh55L/rGkkMUUgFOF4Tix1mEVJxq7UiWh4MdJT6ZTpVDb/7+3YNQTpZ8tYNEcTJqJ9z3FFnRjwXpijCbpfr//kQHwvI28zEaQ7xU04OYeaeudtIosdINX+bAvDb2gyI6ygde37S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775044081; c=relaxed/simple;
	bh=adABYvIqd3NTguvnrLCuC9umM1YlmwtHIfAtv/sMMlY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P0JZ/AD/SsFuKmpexO+ddzZi8dOdM/UFwVWuyjJwYLQRdViN1KkSvqKQzCYsvb8l1gzoQqt+d24yDK+G/SDWOX0cclHmjBjd9HoeXFlbtZ2EmdskZjxPko6LVxJpnzAh5xpziFHfKOpMghepUnGQ+sD8hQ7ZxDO9ccxGNiq81h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W7RUQV2H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60409C4CEF7;
	Wed,  1 Apr 2026 11:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775044081;
	bh=adABYvIqd3NTguvnrLCuC9umM1YlmwtHIfAtv/sMMlY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W7RUQV2HZDvpt7cb2QLkpsSjIXygeJXHzglkI2wvWnPnI2M1b6re/EbnmI0XwokyF
	 wrrwYxN+/b+ugyMYmH9z5Umd525lrDMMtI1jgyazypmGOGTbjEKg2Uf67p5z3f9Bmg
	 c6SqSWS5dXNcFVk9QuiGQs+D+hKuqndvN5lUWvCrCbINYOm3WsPZfDOtxulUNeWqbM
	 y89bDoxVl41VBEb3zkJMUAunBi8T9StVC/clbVAz8kgUAUUzxcNf8AJj/euaS7+TKs
	 GxDpNxLDh92OcnV4pmrI+T0sPk26QqFNokBc1fpaibHISln0xBEqZ/Iba9ePZXRZ+o
	 QQE6E4BNPh56g==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Courbot <acourbot@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <christian@brauner.io>,
	Carlos Llamas <cmllamas@google.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	linux-block@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers),
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	Rae Moar <raemoar63@gmail.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH 10/33] rust: transmute: simplify code with Rust 1.80.0 `split_at_*checked()`
Date: Wed,  1 Apr 2026 13:45:17 +0200
Message-ID: <20260401114540.30108-11-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-1-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,oracle.com,gmail.com,lists.infradead.org,ghiti.fr,lists.freedesktop.org,googlegroups.com,google.com,lists.linux.dev,linuxfoundation.org];
	TAGGED_FROM(0.00)[bounces-82025-lists,linux-doc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,dabbelt.com,eecs.berkeley.edu,nvidia.com,gmail.com,ffwll.ch,linux.dev,davidgow.net,linuxfoundation.org,android.com,brauner.io,google.com,lwn.net];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ojeda@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,lkml];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9534F37A709
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

`feature(split_at_checked)` [1] has been stabilized in Rust 1.80.0 [2],
which is beyond our new minimum Rust version (Rust 1.85.0).

Thus simplify the code using `split_at_*checked()`.

Link: https://github.com/rust-lang/rust/issues/119128 [1]
Link: https://github.com/rust-lang/rust/pull/124678 [2]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/kernel/transmute.rs | 33 ++++++---------------------------
 1 file changed, 6 insertions(+), 27 deletions(-)

diff --git a/rust/kernel/transmute.rs b/rust/kernel/transmute.rs
index b9e6eadc08f5..654b5ede2fe2 100644
--- a/rust/kernel/transmute.rs
+++ b/rust/kernel/transmute.rs
@@ -66,16 +66,9 @@ fn from_bytes_prefix(bytes: &[u8]) -> Option<(&Self, &[u8])>
     where
         Self: Sized,
     {
-        if bytes.len() < size_of::<Self>() {
-            None
-        } else {
-            // PANIC: We checked that `bytes.len() >= size_of::<Self>`, thus `split_at` cannot
-            // panic.
-            // TODO: replace with `split_at_checked` once the MSRV is >= 1.80.
-            let (prefix, remainder) = bytes.split_at(size_of::<Self>());
+        let (prefix, remainder) = bytes.split_at_checked(size_of::<Self>())?;
 
-            Self::from_bytes(prefix).map(|s| (s, remainder))
-        }
+        Self::from_bytes(prefix).map(|s| (s, remainder))
     }
 
     /// Converts a mutable slice of bytes to a reference to `Self`.
@@ -108,16 +101,9 @@ fn from_bytes_mut_prefix(bytes: &mut [u8]) -> Option<(&mut Self, &mut [u8])>
     where
         Self: AsBytes + Sized,
     {
-        if bytes.len() < size_of::<Self>() {
-            None
-        } else {
-            // PANIC: We checked that `bytes.len() >= size_of::<Self>`, thus `split_at_mut` cannot
-            // panic.
-            // TODO: replace with `split_at_mut_checked` once the MSRV is >= 1.80.
-            let (prefix, remainder) = bytes.split_at_mut(size_of::<Self>());
+        let (prefix, remainder) = bytes.split_at_mut_checked(size_of::<Self>())?;
 
-            Self::from_bytes_mut(prefix).map(|s| (s, remainder))
-        }
+        Self::from_bytes_mut(prefix).map(|s| (s, remainder))
     }
 
     /// Creates an owned instance of `Self` by copying `bytes`.
@@ -147,16 +133,9 @@ fn from_bytes_copy_prefix(bytes: &[u8]) -> Option<(Self, &[u8])>
     where
         Self: Sized,
     {
-        if bytes.len() < size_of::<Self>() {
-            None
-        } else {
-            // PANIC: We checked that `bytes.len() >= size_of::<Self>`, thus `split_at` cannot
-            // panic.
-            // TODO: replace with `split_at_checked` once the MSRV is >= 1.80.
-            let (prefix, remainder) = bytes.split_at(size_of::<Self>());
+        let (prefix, remainder) = bytes.split_at_checked(size_of::<Self>())?;
 
-            Self::from_bytes_copy(prefix).map(|s| (s, remainder))
-        }
+        Self::from_bytes_copy(prefix).map(|s| (s, remainder))
     }
 }
 
-- 
2.53.0



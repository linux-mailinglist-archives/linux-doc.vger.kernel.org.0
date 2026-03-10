Return-Path: <linux-doc+bounces-78704-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPnaIvtbsGn2iQIAu9opvQ
	(envelope-from <linux-doc+bounces-78704-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 10 Mar 2026 18:59:23 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 11951256098
	for <lists+linux-doc@lfdr.de>; Tue, 10 Mar 2026 18:59:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 92E1A3105A4E
	for <lists+linux-doc@lfdr.de>; Tue, 10 Mar 2026 17:55:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87A5F39DBF7;
	Tue, 10 Mar 2026 17:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="Vx2bXKOm"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7ABE1B6D1A
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 17:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773165309; cv=none; b=HxjF3YaCD7YAkIj3Tn6MTLBosuspzusfut4HwFDw1/ICk3fDPkw+ro31ljJqYgOPxYyAFykRkFrDnsoMIh51oFDg6Eu8htEPRg+O3Ou+XxgKQBpZcR0mTVewy+0MLOF+OBbglntxyeBz+vLK/DfnAKYxQ3onzmUQEjVhJbk/+vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773165309; c=relaxed/simple;
	bh=j3RO6GN6DceqVgbfJifPD7Mr4hXFOiKjw/TNqZPOPe0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=diGfUq4o6gNG9UIkzjoFZ9xAQGJoZAx6mJwpQns+W5TwRYIY6ojT30bw3cMqgdiAgn7209eb1ZG6XqjwHvvHNtmyyLrHrwb1UqraoeZAlTVlH4a6Bj7EYC8yRbFXT6tpfMXjYKFNSwRXC50b29q5na53thcsy4i8cGWlXaIBvLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=Vx2bXKOm; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773165305; x=1773424505;
	bh=sI6qR0mJYdxFmMNIqBBXQAz3LXcRYa0zIgeJz3FHVi8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Vx2bXKOmiijawesKHgTU59oddiSP9j0FE5pp25ea7SBlT13lyY5yhRngs83ZWoLTR
	 KMHPfuhFFFokTHI4UEbseY5P4WSnkTPNQANVQ2LcnBPxrcXTMa9BdzjuB+hJzM50P2
	 gxIkjfPUVnSAqjK2ir7wB3Ipo1t6i9FTqbDIppHa8EwI+gPmv/GYVoS8Oe3kjY1ox+
	 EfJlFdwJgROo9e6WZdbswaO3GufrSPpHNiz6OwIqI4cxc2m7LSDWLbnIR4UkajpoEY
	 6vLqL8AF4ewAMxV0HxJk6d/LxuAmYjyXn9GJTuYUXmX+a/bdhjjFFMUJlsjxCjNS8R
	 t3BPtCmqHjiWw==
Date: Tue, 10 Mar 2026 17:55:00 +0000
To: akpm@linux-foundation.org, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: m.wieczorretman@pm.me, Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kasan-dev@googlegroups.com, workflows@vger.kernel.org
Subject: [PATCH v11 15/15] docs: Update KASAN and x86 memory map documentations
Message-ID: <9e1176112817b3cb7bb7daa982b6d4f5b2452749.1773164688.git.m.wieczorretman@pm.me>
In-Reply-To: <cover.1773164688.git.m.wieczorretman@pm.me>
References: <cover.1773164688.git.m.wieczorretman@pm.me>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 1cf51b8a6337a63e242ed43be86c30aa3516a39e
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 11951256098
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-78704-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linux-foundation.org,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,lwn.net,linuxfoundation.org,gmail.com,google.com,arm.com];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[pm.me:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.wieczorretman@pm.me,linux-doc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,pm.me:dkim,pm.me:mid]
X-Rspamd-Action: no action

From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>

Update the documentation concerning changes to x86's memory address
space and new architecture addition to KASAN's software tag-based mode.

Redo paragraphs in KASAN's documentation on hardware and software
implementation details to allow better extensibility.

Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
---
Changelog v11:
- Split off the documentation portion of v10's patch 13.
- Apply Dave's suggestions to reformat the footer explaining alternate
  ranges for KASAN shadow memory, put arch hardware implementation in a
  separate paragraph and make a table to hold various implementation
  details.

 Documentation/arch/x86/x86_64/mm.rst | 21 +++++++++-
 Documentation/dev-tools/kasan.rst    | 61 ++++++++++++++++++++--------
 2 files changed, 62 insertions(+), 20 deletions(-)

diff --git a/Documentation/arch/x86/x86_64/mm.rst b/Documentation/arch/x86/=
x86_64/mm.rst
index a6cf05d51bd8..3c78ab1afd8d 100644
--- a/Documentation/arch/x86/x86_64/mm.rst
+++ b/Documentation/arch/x86/x86_64/mm.rst
@@ -60,7 +60,7 @@ Complete virtual memory map with 4-level page tables
    ffffe90000000000 |  -23    TB | ffffe9ffffffffff |    1 TB | ... unused=
 hole
    ffffea0000000000 |  -22    TB | ffffeaffffffffff |    1 TB | virtual me=
mory map (vmemmap_base)
    ffffeb0000000000 |  -21    TB | ffffebffffffffff |    1 TB | ... unused=
 hole
-   ffffec0000000000 |  -20    TB | fffffbffffffffff |   16 TB | KASAN shad=
ow memory
+   ffffec0000000000 |  -20    TB | fffffbffffffffff |   16 TB | KASAN shad=
ow memory[1]
   __________________|____________|__________________|_________|___________=
_________________________________________________
                                                               |
                                                               | Identical =
layout to the 56-bit one from here on:
@@ -130,7 +130,7 @@ Complete virtual memory map with 5-level page tables
    ffd2000000000000 |  -11.5  PB | ffd3ffffffffffff |  0.5 PB | ... unused=
 hole
    ffd4000000000000 |  -11    PB | ffd5ffffffffffff |  0.5 PB | virtual me=
mory map (vmemmap_base)
    ffd6000000000000 |  -10.5  PB | ffdeffffffffffff | 2.25 PB | ... unused=
 hole
-   ffdf000000000000 |   -8.25 PB | fffffbffffffffff |   ~8 PB | KASAN shad=
ow memory
+   ffdf000000000000 |   -8.25 PB | fffffbffffffffff |   ~8 PB | KASAN shad=
ow memory[1]
   __________________|____________|__________________|_________|___________=
_________________________________________________
                                                               |
                                                               | Identical =
layout to the 47-bit one from here on:
@@ -178,3 +178,20 @@ correct as KASAN disables KASLR.
=20
 For both 4- and 5-level layouts, the KSTACK_ERASE_POISON value in the last=
 2MB
 hole: ffffffffffff4111
+
+1. The range is different based on what KASAN mode is used and what paging=
 level
+   is used:
+
+::
+
+  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
+      Start addr    |   Offset   |     End addr     |  Size   | VM area de=
scription
+  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
+                    |            |                  |         | 4-level pa=
ging:
+   ffffec0000000000 |  -20    TB | fffffbffffffffff |   16 TB | KASAN shad=
ow memory (generic mode)
+   fffff40000000000 |   -8    TB | fffffbffffffffff |    8 TB | KASAN shad=
ow memory (software tag-based mode)
+  __________________|____________|__________________|_________|___________=
____________________________________
+                    |            |                  |         | 5-level pa=
ging:
+   ffdf000000000000 |   -8.25 PB | fffffbffffffffff |   ~8 PB | KASAN shad=
ow memory (generic mode)
+   ffeffc0000000000 |   -6    PB | fffffbffffffffff |    4 PB | KASAN shad=
ow memory (software tag-based mode)
+  __________________|____________|__________________|_________|___________=
____________________________________
diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools/ka=
san.rst
index b11c1be8dff4..d42d80e9fcf1 100644
--- a/Documentation/dev-tools/kasan.rst
+++ b/Documentation/dev-tools/kasan.rst
@@ -22,8 +22,8 @@ architectures, but it has significant performance and mem=
ory overheads.
=20
 Software Tag-Based KASAN or SW_TAGS KASAN, enabled with CONFIG_KASAN_SW_TA=
GS,
 can be used for both debugging and dogfood testing, similar to userspace H=
WASan.
-This mode is only supported for arm64, but its moderate memory overhead al=
lows
-using it for testing on memory-restricted devices with real workloads.
+This mode is only supported for arm64 and x86, but its moderate memory ove=
rhead
+allows using it for testing on memory-restricted devices with real workloa=
ds.
=20
 Hardware Tag-Based KASAN or HW_TAGS KASAN, enabled with CONFIG_KASAN_HW_TA=
GS,
 is the mode intended to be used as an in-field memory bug detector or as a
@@ -346,16 +346,21 @@ Software Tag-Based KASAN
 ~~~~~~~~~~~~~~~~~~~~~~~~
=20
 Software Tag-Based KASAN uses a software memory tagging approach to checki=
ng
-access validity. It is currently only implemented for the arm64 architectu=
re.
-
-Software Tag-Based KASAN uses the Top Byte Ignore (TBI) feature of arm64 C=
PUs
-to store a pointer tag in the top byte of kernel pointers. It uses shadow =
memory
-to store memory tags associated with each 16-byte memory cell (therefore, =
it
-dedicates 1/16th of the kernel memory for shadow memory).
-
-On each memory allocation, Software Tag-Based KASAN generates a random tag=
, tags
-the allocated memory with this tag, and embeds the same tag into the retur=
ned
-pointer.
+access validity. It is currently only implemented for the arm64 and x86
+architectures. To function, special hardware CPU features* are needed for
+repurposing space inside the kernel pointers to store pointer tags.
+
+Software Tag-Based mode uses shadow memory to store memory tags associated=
 with
+each 16-byte memory cell (therefore, it dedicates 1/16th of the kernel mem=
ory
+for shadow memory). On each memory allocation, Software Tag-Based KASAN
+generates a random tag, tags the allocated memory with this tag, and embed=
s the
+same tag into the returned pointer.
+
+Two special tag values can be distinguished. A match-all pointer tag (othe=
rwise
+called the 'kernel tag' because it's supposed to be equal to the value nor=
mally
+present in the same bits of the linear address when KASAN is disabled) -
+accesses through such pointers are not checked. Another value is also rese=
rved
+to tag freed memory regions.
=20
 Software Tag-Based KASAN uses compile-time instrumentation to insert check=
s
 before each memory access. These checks make sure that the tag of the memo=
ry
@@ -367,12 +372,32 @@ Software Tag-Based KASAN also has two instrumentation=
 modes (outline, which
 emits callbacks to check memory accesses; and inline, which performs the s=
hadow
 memory checks inline). With outline instrumentation mode, a bug report is
 printed from the function that performs the access check. With inline
-instrumentation, a ``brk`` instruction is emitted by the compiler, and a
-dedicated ``brk`` handler is used to print bug reports.
-
-Software Tag-Based KASAN uses 0xFF as a match-all pointer tag (accesses th=
rough
-pointers with the 0xFF pointer tag are not checked). The value 0xFE is cur=
rently
-reserved to tag freed memory regions.
+instrumentation, the compiler emits a specific arch-dependent instruction =
with a
+dedicated handler to print bug reports.
+
+Architecture specific details:
+
+::
+
+  +-----------------------+--------+---------------------+
+  | detail \ architecture | arm64  | x86                 |
+  +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=
=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D+
+  | Hardware feature      | TBI    | LAM                 |
+  +-----------------------+--------+---------------------+
+  | Kernel tag            | 0xFF   | 0x0F                |
+  +-----------------------+--------+---------------------+
+  | Freed memory tag      | 0xFE   | 0x0E                |
+  +-----------------------+--------+---------------------+
+  | Tag width             | 8 bits | 4 bits              |
+  +-----------------------+--------+---------------------+
+  | Inline instruction    | brk    | no compiler support |
+  +-----------------------+--------+---------------------+
+
+* Different architectures implement different hardware features to mask an=
d
+  repurpose linear address bits. arm64 utilizes Top Byte Ignore (TBI) to m=
ask
+  out and allow storing tags in the top byte of the pointer. x86 uses Line=
ar
+  Address Masking (LAM) to store tags in the four bits of the kernel point=
er's
+  top byte.
=20
 Hardware Tag-Based KASAN
 ~~~~~~~~~~~~~~~~~~~~~~~~
--=20
2.53.0




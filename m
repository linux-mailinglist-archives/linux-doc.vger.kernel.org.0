Return-Path: <linux-doc+bounces-93808-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ye2yHBSKP2pCUQkAu9opvQ
	(envelope-from <linux-doc+bounces-93808-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Sat, 27 Jun 2026 10:30:12 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D22DD6D17AA
	for <lists+linux-doc@lfdr.de>; Sat, 27 Jun 2026 10:30:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=davidgow.net (policy=none);
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93808-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-93808-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 435FD3035B73
	for <lists+linux-doc@lfdr.de>; Sat, 27 Jun 2026 08:29:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B16F392837;
	Sat, 27 Jun 2026 08:29:45 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC7A319617;
	Sat, 27 Jun 2026 08:29:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782548985; cv=none; b=T3kByLnoxLgKBGMkzirbv37e+DaxPVfMRm8sC4e4+GBga01IlaLajaHMSAIZgr63YhX9mybQOvfspT0TDNU5m/kJWg/Y41rZR1g+gV0TPSwIB47y8wM4aU4z2/ujTZbwYPym6kufBWURSKCupy3CH9H7E2GUa6kPK99vAgABZdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782548985; c=relaxed/simple;
	bh=JNgVhYn+yTtQINkYxKJl/hkk3DbKEukK6zkc2/BP5zo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QTqQGSuIvaVifXa8zbvXwA5hlAbj0gfL85aWV7hUAlq2q0euUyqDrWoETl2N9iZG+kSP3OAyeNvbSITJ7P/GbAR08CquTcqf5N/s8wUGPCXU0/lWkDChGU/Dyv8w9Do5pIKKwWoISJZiZk9daIoi8KGerQVLoRR1rkQj0Vc69E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; arc=none smtp.client-ip=203.29.242.92
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id C26241D283A; Sat, 27 Jun 2026 16:29:35 +0800 (AWST)
X-Spam-Level: 
Received: from sparky.lan (unknown [IPv6:2001:8003:8810:ea00::9c4])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 2F4F81CD587;
	Sat, 27 Jun 2026 16:29:31 +0800 (AWST)
From: David Gow <david@davidgow.net>
To: Brendan Higgins <brendan.higgins@linux.dev>,
	Rae Moar <raemoar63@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: David Gow <david@davidgow.net>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 2/2] Documentation: kunit: Fix outdated FAQ entries
Date: Sat, 27 Jun 2026 16:29:20 +0800
Message-ID: <20260627082921.1709181-2-david@davidgow.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260627082921.1709181-1-david@davidgow.net>
References: <20260627082921.1709181-1-david@davidgow.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.14 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[davidgow.net : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:brendan.higgins@linux.dev,m:raemoar63@gmail.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:david@davidgow.net,m:linux-kselftest@vger.kernel.org,m:kunit-dev@googlegroups.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert@linux-m68k.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-93808-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_TO(0.00)[linux.dev,gmail.com,lwn.net,linuxfoundation.org];
	FORGED_SENDER(0.00)[david@davidgow.net,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[david@davidgow.net,linux-doc@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[googlegroups.com:email,davidgow.net:email,davidgow.net:mid,davidgow.net:from_mime,vger.kernel.org:from_smtp,kunit.py:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D22DD6D17AA

The KUnit FAQ was written when KUnit in general, and kunit.py in
particular, were very heavily focused on UML. While they were updated
slightly when qemu support was added, they've not really kept pace with
changes to KUnit or the structure of the rest of the documentation.

Update them to describe how to run kunit.py with non-UML architectures, and
to point to the run_manual.rst page for further detail on how to run KUnit
without kunit.py, as it's the authoratative documentation on that subject.

Signed-off-by: David Gow <david@davidgow.net>
---
 Documentation/dev-tools/kunit/faq.rst | 43 +++++++++++++++------------
 1 file changed, 24 insertions(+), 19 deletions(-)

diff --git a/Documentation/dev-tools/kunit/faq.rst b/Documentation/dev-tools/kunit/faq.rst
index fae426f2634a..b1341c1a62d9 100644
--- a/Documentation/dev-tools/kunit/faq.rst
+++ b/Documentation/dev-tools/kunit/faq.rst
@@ -25,19 +25,21 @@ disqualifying any of them from being considered unit testing frameworks.
 Does KUnit support running on architectures other than UML?
 ===========================================================
 
-Yes, mostly.
+Yes. KUnit can run on any architecture, though the kunit.py tool can only
+build and run kernels for some architectures (of which UML is the default).
 
-For the most part, the KUnit core framework (what we use to write the tests)
-can compile to any architecture. It compiles like just another part of the
-kernel and runs when the kernel boots, or when built as a module, when the
-module is loaded.  However, there is infrastructure, like the KUnit Wrapper
-(``tools/testing/kunit/kunit.py``) that might not support some architectures
-(see :ref:`kunit-on-qemu`).
+You can build and run tests without kunit.py at all on any architecture by
+enabling ``CONFIG_KUNIT=y`` and booting the kernel.
+See Documentation/dev-tools/kunit/run_manual.rst for more details.
 
-In short, yes, you can run KUnit on other architectures, but it might require
-more work than using KUnit on UML.
+Alternatively, kunit.py supports many common architectures using
+cross-compilers and the qemu emulator. This can be done using the ``--arch``
+parameter when running the tests, and the ``--cross_compile`` parameter
+when building (if the architecture is not supported by the host compiler).
+See :ref:`kunit-on-qemu` for more details.
 
-For more information, see :ref:`kunit-on-non-uml`.
+When writing tests targeting other architectures, it's worth keeping the tips
+on the :ref:`kunit-on-non-uml` page in mind.
 
 .. _kinds-of-tests:
 
@@ -78,27 +80,30 @@ things to try.
    down where an issue is occurring. (If you think the parser is at fault, you
    can run it manually against ``stdin`` or a file with ``kunit.py parse``.)
 3. Running the UML kernel directly can often reveal issues or error messages,
-   ``kunit_tool`` ignores. This should be as simple as running ``./vmlinux``
-   after building the UML kernel (for example, by using ``kunit.py build``).
+   ``kunit_tool`` ignores. This should be as simple as runningi the ``vmlinux``
+   binary in the output directory (by default ``./.kunit/vmlinux``) after
+   building the UML kernel (for example, by using ``kunit.py build``).
    Note that UML has some unusual requirements (such as the host having a tmpfs
    filesystem mounted), and has had issues in the past when built statically and
    the host has KASLR enabled. (On older host kernels, you may need to run
    ``setarch `uname -m` -R ./vmlinux`` to disable KASLR.)
-4. Make sure the kernel .config has ``CONFIG_KUNIT=y`` and at least one test
+4. Try running KUnit on a different architecture by using the ``--arch``
+   option. On an x86_64 host, using ``--arch=x86_64`` is a good first step.
+5. Make sure the kernel .config has ``CONFIG_KUNIT=y`` and at least one test
    (e.g. ``CONFIG_KUNIT_EXAMPLE_TEST=y``). kunit_tool will keep its .config
    around, so you can see what config was used after running ``kunit.py run``.
    It also preserves any config changes you might make, so you can
    enable/disable things with ``make ARCH=um menuconfig`` or similar, and then
    re-run kunit_tool.
-5. Try to run ``make ARCH=um defconfig`` before running ``kunit.py run``. This
+6. Try to run ``make ARCH=um defconfig`` before running ``kunit.py run``. This
    may help clean up any residual config items which could be causing problems.
-6. Finally, try running KUnit outside UML. KUnit and KUnit tests can be
-   built into any kernel, or can be built as a module and loaded at runtime.
-   Doing so should allow you to determine if UML is causing the issue you're
-   seeing. When tests are built-in, they will execute when the kernel boots, and
+7. Finally, try running KUnit manually, instead of via ``kunit.py``. KUnit can
+   be built into any kernel, or can be built as a module and loaded at runtime.
+   When tests are built-in, they will execute when the kernel boots, and
    modules will automatically execute associated tests when loaded. Test results
    can be collected from ``/sys/kernel/debug/kunit/<test suite>/results``, and
-   can be parsed with ``kunit.py parse``. For more details, see :ref:`kunit-on-qemu`.
+   can be parsed with ``kunit.py parse``. For more details, see
+   Documentation/dev-tools/kunit/run_manual.rst
 
 If none of the above tricks help, you are always welcome to email any issues to
 kunit-dev@googlegroups.com.
-- 
2.54.0


